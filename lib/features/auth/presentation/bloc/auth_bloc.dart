import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/usecases/current_user.dart';
import 'package:blog_app/features/auth/domain/usecases/user_login.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserLogin userLogin,
    required CurrentUser currentUser,
  })  : _userSignUp = userSignUp,
        _userLogin = userLogin,
        _currentUser = currentUser,
        super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignup);

    on<AuthLogin>(_onAuthLogin);

    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }

  void _onAuthSignup(AuthSignUp event, Emitter<AuthState> emit) async {
    on<AuthSignUp>((event, emit) async {
      emit(AuthBlocLoading());
      final res = await _userSignUp(
        UserSignupParams(
            email: event.email, name: event.name, password: event.password),
      );

      res.fold((l) => emit(AuthBlocAuthFailure(message: l.message)),
          (r) => AuthBlocAuthSuccess(user: r));
    });
  }

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    on<AuthLogin>((event, emit) async {
      emit(AuthBlocLoading());
      final res = await _userLogin(
        UserLoginParams(email: event.email, password: event.password),
      );

      res.fold((l) => emit(AuthBlocAuthFailure(message: l.message)),
          (r) => AuthBlocAuthSuccess(user: r));
    });
  }

  void _isUserLoggedIn(
      AuthIsUserLoggedIn event, Emitter<AuthState> emit) async {
    final res = await _currentUser(NoParams());

    res.fold(
      (l) => emit(AuthBlocAuthFailure(message: l.message)),
      (r) => emit(AuthBlocAuthSuccess(user: r)),
    );
  }
}
