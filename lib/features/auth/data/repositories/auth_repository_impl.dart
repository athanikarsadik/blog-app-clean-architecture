import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSources authRemoteDataSources;

  AuthRepositoryImpl(this.authRemoteDataSources);

  @override
  Future<Either<Failure, String>> signInwithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement signInwithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpwithEmailPassword(
      {required String name, required String email, required String password}) {
    // TODO: implement signUpwithEmailPassword
    throw UnimplementedError();
  }
}
