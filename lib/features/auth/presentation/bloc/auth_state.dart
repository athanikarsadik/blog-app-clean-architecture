part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthBlocInitial extends AuthState {}

final class AuthBlocLoading extends AuthState {}

final class AuthBlocAuthSuccess extends AuthState {
  final String uid;

  AuthBlocAuthSuccess({required this.uid});
}

final class AuthBlocAuthFailure extends AuthState {
  final String message;

  AuthBlocAuthFailure({required this.message});
}
