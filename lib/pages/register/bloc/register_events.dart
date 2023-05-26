abstract class RegisterEvents{
  const RegisterEvents();

}

class UserNameEvent extends RegisterEvents{
  final String username;
  UserNameEvent(this.username);
}

class RegisterEmailEvent extends RegisterEvents{
  final String email;
  RegisterEmailEvent(this.email);
}

class RegisterPasswordEvent extends RegisterEvents{
  final String password;
  RegisterPasswordEvent(this.password);
}

class ConfirmPasswordEvent extends RegisterEvents{
  final String confirmpassword;
  ConfirmPasswordEvent(this.confirmpassword);
}