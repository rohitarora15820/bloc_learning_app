import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/widgets/flutter_toast.dart';
import 'package:learning_app/pages/register/bloc/register_bloc.dart';

class RegisterController{
  final BuildContext context;
  const RegisterController(this.context);

  void handleRegister()async{
      final state=context.read<RegisterBloc>().state;
      String userName=state.username;
      String email=state.email;
      String password=state.password;
      String confirmPwd=state.confirmpassword;

      if(userName.isEmpty){
        toastInfo(msg: "User name is empty");
        return;
      }
      if(email.isEmpty){
        toastInfo(msg: "Email is empty");
        return;
      }
      if(password.isEmpty){
        toastInfo(msg: "Password is empty");
        return;
      }
      if(confirmPwd.isEmpty){
        toastInfo(msg: "Confirm Password is empty");
        return;
      }

      try{
        final credential =await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        if(credential.user!= null){
          await credential.user?.sendEmailVerification();
          await credential.user?.updateDisplayName(userName);
          toastInfo(msg: "An Email has been sent to your $email Please check your inbox");
          Navigator.of(context).pop();
        }

      }
   on FirebaseAuthException catch(e) {
     if (e.code == "email-already-in-use") {
            toastInfo(msg: "Email already in use");
            return;
          } else if (e.code == "weak-password") {
            toastInfo(msg: "The password provided is too weak to be used");
            return;
          } else if (e.code == "invalid-email") {
            toastInfo(msg: "wrong email format");
            return;
          }
      }



  }


}