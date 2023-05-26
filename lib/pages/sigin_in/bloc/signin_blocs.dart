import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/sigin_in/bloc/signin_events.dart';
import 'package:learning_app/pages/sigin_in/bloc/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emitter) {
    log("email is ${event.email}");
    emitter(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emitter) {
    log("password is ${event.password}");
    emitter(state.copyWith(password: event.password));
  }
}
