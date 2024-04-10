import 'package:blog_app/core/constants/consts.dart';
import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/network/connection_checker.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/core/common/entities/user.dart';
import 'package:blog_app/features/auth/data/models/user_model.dart';
import 'package:blog_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSources authRemoteDataSources;
  final ConnectionChecker connectionChecker;

  const AuthRepositoryImpl(this.authRemoteDataSources, this.connectionChecker);

  @override
  Future<Either<Failure, User>> signInwithEmailPassword(
      {required String email, required String password}) async {
    return _getUser(
      () async => await authRemoteDataSources.signInwithEmailPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, User>> signUpwithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    return _getUser(
      () async => await authRemoteDataSources.signUpwithEmailPassword(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  Future<Either<Failure, User>> _getUser(
    Future<User> Function() fn,
  ) async {
    if (!await (connectionChecker.isConnected)) {
      return left(Failure(Constants.noConnetionErrorMessage));
    }
    try {
      final user = await fn();
      return right(user);
    } on ServerExceptions catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> currentUser() async {
    if (!await (connectionChecker.isConnected)) {
      final session = authRemoteDataSources.currentUserSession;
      if (session == null) {
        return left(Failure('User not logged in!'));
      }

      return right(
        UserModel(
          id: session.user.id,
          name: '',
          email: session.user.email ?? '',
        ),
      );
    }
    try {
      final user = await authRemoteDataSources.getCurrentUserData();
      if (user == null) {
        return left(Failure("User not logged in!"));
      }
      return right(user);
    } on ServerExceptions catch (e) {
      return left(Failure(e.message));
    }
  }
}
