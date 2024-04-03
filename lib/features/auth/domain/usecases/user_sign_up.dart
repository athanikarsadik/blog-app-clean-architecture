import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/core/common/entities/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<User, UserSignupParams> {
  final AuthRepository authRepository;

  UserSignUp({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(UserSignupParams params) async {
    return await authRepository.signUpwithEmailPassword(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignupParams {
  final String email;
  final String name;
  final String password;

  UserSignupParams(
      {required this.email, required this.name, required this.password});
}
