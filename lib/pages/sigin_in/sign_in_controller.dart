
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/entities/values/constants.dart';
import 'package:learning_app/common/widgets/flutter_toast.dart';
import 'package:learning_app/global.dart';
import 'package:learning_app/pages/sigin_in/bloc/signin_blocs.dart';

class SignInController {
  final BuildContext context;

  SignInController(this.context);

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;

        String emailAdress = state.email;
        String passwordAdress = state.password;
        if (emailAdress.isEmpty) {
          toastInfo(msg: "Email address is empty");
          return;
        }

        if (passwordAdress.isEmpty) {
          toastInfo(msg: "Password address is empty");
          return;
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAdress, password: passwordAdress);
          if (credential.user == null) {}
          if (credential.user!.emailVerified) {}

          var user = credential.user;
          if (user != null) {
            toastInfo(msg: "Verified");

            Global.storageServices.setString(AppContatnts.STORAGE_USER_TOKEN_KEY, "123456");
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
            return;
          } else {
            toastInfo(msg: "Not verified");
            return;
            //we have no verified credentials
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            toastInfo(msg: "User not found");
            return;
          } else if (e.code == "wrong-password") {
            toastInfo(msg: "Wrong password");
            return;
          } else if (e.code == "invalid-email") {
            toastInfo(msg: "wrong email format");
            return;
          }
        }
      }
    } catch (e) {
      toastInfo(msg: "Error: $e");
    }
  }
}
