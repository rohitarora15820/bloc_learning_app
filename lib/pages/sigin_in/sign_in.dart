import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/sigin_in/bloc/signin_blocs.dart';
import 'package:learning_app/pages/sigin_in/bloc/signin_events.dart';
import 'package:learning_app/pages/sigin_in/bloc/signin_state.dart';
import 'package:learning_app/pages/sigin_in/sign_in_controller.dart';


import '../common_widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Log In"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context),
                    Center(
                        child:
                            resuableText("Or use your email account to login")),
                    Container(
                      margin: EdgeInsets.only(top: 66.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            resuableText("Email"),
                            SizedBox(
                              height: 5.h,
                            ),
                            buidTextField(
                                "Enter your email address", "email", "user",
                                (value) {
                              context.read<SignInBloc>().add(EmailEvent(value));
                            }),
                            resuableText("Password"),
                            SizedBox(
                              height: 5.h,
                            ),
                            buidTextField(
                                "Enter your password", "password", "lock",
                                (value) {
                              context
                                  .read<SignInBloc>()
                                  .add(PasswordEvent(value));
                            })
                          ]),
                    ),
                    forgotPassword(),
                    buildLoginAndRegisterbtn("Log in", "login", () {
                      SignInController(context).handleSignIn("email");
                    }),
                    buildLoginAndRegisterbtn("Register", "register", () {

                      Navigator.of(context).pushNamed("/register");
                    })
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
