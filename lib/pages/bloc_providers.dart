import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/register/bloc/register_bloc.dart';
import 'package:learning_app/pages/sigin_in/bloc/signin_blocs.dart';
import 'package:learning_app/pages/welcome/bloc/welcomee_bloc.dart';

class AppBlocProviders{
  static get allBlocProviders=>[
     BlocProvider(lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(create: (context) => RegisterBloc(),)
  ];
}