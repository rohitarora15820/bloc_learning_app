import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/routes/name.dart';
import 'package:learning_app/pages/application/application_page.dart';
import 'package:learning_app/pages/register/bloc/register_bloc.dart';
import 'package:learning_app/pages/register/register.dart';
import 'package:learning_app/pages/sigin_in/bloc/signin_blocs.dart';
import 'package:learning_app/pages/sigin_in/sign_in.dart';
import 'package:learning_app/pages/welcome/bloc/welcomee_bloc.dart';
import 'package:learning_app/pages/welcome/welcome.dart';

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const WelcomePage(),
          bloc: BlocProvider(
            create: (context) => WelcomeBloc(),
          )),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: const SignInPage(),
          bloc: BlocProvider(
            create: (context) => SignInBloc(),
          )),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const RegisterPage(),
          bloc: BlocProvider(
            create: (context) => RegisterBloc(),
          )),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocPrividers = <dynamic>[];
    for (var bloc in routes()) {
      blocPrividers.add(bloc.bloc);
    }
    return blocPrividers;
  }



  static MaterialPageRoute GenerateRouteSetting(RouteSettings settings){
    if(settings.name!=null){
      var result=routes().where((element) => element.route == settings.name);
      if(result.isNotEmpty){
        print("valid route name ${settings.name}");
        return MaterialPageRoute(builder: (context) => result.first.page,settings:settings );
      }
    }
    print("invalid route name ${settings.name}");
    return MaterialPageRoute(builder: (context) =>const SignInPage());
  }
}
