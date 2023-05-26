import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_events.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomEvent>((event, emit) => emit(WelcomeState(page: state.page)));
  }
}
