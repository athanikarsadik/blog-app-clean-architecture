import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;

  AuthBloc({required UserSignUp userSignUp})
      : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      on<AuthSignUp>((event, emit) async {
        final res = await _userSignUp(
          UserSignupParams(
              email: event.email, name: event.name, password: event.password),
        );

        res.fold((l) => emit(AuthBlocAuthFailure(message: l.message)),
            (r) => AuthBlocAuthSuccess(uid: r));
      });
    });
  }
}
