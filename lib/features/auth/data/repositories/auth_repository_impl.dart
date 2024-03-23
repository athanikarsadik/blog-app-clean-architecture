import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSources authRemoteDataSources;

  AuthRepositoryImpl(this.authRemoteDataSources);

  @override
  Future<Either<Failure, String>> signInwithEmailPassword(
      {required String email, required String password}) async {
    throw Exception();
    // try {
    //   final userId = await authRemoteDataSources.signInwithEmailPassword(email: email, password: password);
    // } catch (e) {

    // }
  }

  @override
  Future<Either<Failure, String>> signUpwithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userID = await authRemoteDataSources.signUpwithEmailPassword(
          name: name, email: email, password: password);
      return right(userID);
    } on ServerExceptions catch (e) {
      return left(Failure(e.message));
    }
  }
}
