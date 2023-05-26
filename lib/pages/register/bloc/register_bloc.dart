import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/register/bloc/register_events.dart';
import 'package:learning_app/pages/register/bloc/register_states.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBloc() : super(const RegisterStates()) {
    on<UserNameEvent>(_userNameEvent);
    on<RegisterEmailEvent>(_emailEvent);
    on<RegisterPasswordEvent>(_passwordEvent);
    on<ConfirmPasswordEvent>(_confirmPasswordEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<RegisterStates> emitter) {
    log("email is ${event.username}");

    emitter(state.copyWith(username: event.username));
  }

  void _emailEvent(RegisterEmailEvent event, Emitter<RegisterStates> emitter) {
    log("email is ${event.email}");

    emitter(state.copyWith(email: event.email));
  }

  void _passwordEvent(RegisterPasswordEvent event, Emitter<RegisterStates> emitter) {
    log("email is ${event.password}");

    emitter(state.copyWith(password: event.password));
  }

  void _confirmPasswordEvent(
      ConfirmPasswordEvent event, Emitter<RegisterStates> emitter) {
    log("email is ${event.confirmpassword}");

    emitter(state.copyWith(confirmpassword: event.confirmpassword));
  }
}
