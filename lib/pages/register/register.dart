import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/register/bloc/register_bloc.dart';
import 'package:learning_app/pages/register/bloc/register_events.dart';
import 'package:learning_app/pages/register/bloc/register_states.dart';
import 'package:learning_app/pages/register/register_controller.dart';

import '../common_widgets.dart';



class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
 @override
  Widget build(BuildContext context) {

    return BlocBuilder<RegisterBloc,RegisterStates>(builder: (context, state) {
      return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Sign Up"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    
                    Center(
                        child:
                            resuableText("Enter your details below and free sign up")),
                    Container(
                      margin: EdgeInsets.only(top: 66.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                               resuableText("User Name"),
                            
                            buidTextField(
                                "Enter your user name", "user", "user",
                                (value) {
                              context.read<RegisterBloc>().add(UserNameEvent(value));
                            }),
                            resuableText("Email"),
                            
                            buidTextField(
                                "Enter your email address", "email", "user",
                                (value) {
                              context.read<RegisterBloc>().add(RegisterEmailEvent(value));
                            }),
                            resuableText("Password"),
                            
                            buidTextField(
                                "Enter your password", "password", "lock",
                                (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(RegisterPasswordEvent(value));
                            }),  resuableText("Confirm Password"),
                            
                            buidTextField(
                                "Enter your confirm password", "password", "lock",
                                (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(ConfirmPasswordEvent(value));
                            })

                          ]),
                    ),
                  Container(margin: EdgeInsets.only(left: 25.w,right: 25.w),
                  child:  resuableText("By creating your account you have to agree with our terms & conditions"),),
                    buildLoginAndRegisterbtn("Sign Up", "login", () {
                      RegisterController(context).handleRegister();
                    }),
                  
                  ],
                ),
              ),
            ),
          ),
        );
    },);
  }

}