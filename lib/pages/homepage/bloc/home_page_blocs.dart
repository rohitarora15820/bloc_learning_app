import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/homepage/bloc/home_page_events.dart';
import 'package:learning_app/pages/homepage/bloc/home_page_states.dart';

class HomePageBlocs extends Bloc<HomePageEvents,HomePageStates>{
  HomePageBlocs():super(const HomePageStates()){
    on<HomePageDots>(homePageDots);
  }

  void homePageDots(HomePageDots event,Emitter<HomePageStates> emtter){
    emtter(state.copyWith(
      index: event.index
    ));
  }
}