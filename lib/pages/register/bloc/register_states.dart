class RegisterStates {
  final String username;
  final String email;
  final String password;
  final String confirmpassword;

  const RegisterStates(
      {this.username = "",
      this.email = "",
      this.password = "",
      this.confirmpassword = ""});

  RegisterStates copyWith(
      {String? username,
      String? email,
      String? password,
      String? confirmpassword}) {
    return RegisterStates(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmpassword: confirmpassword ?? this.confirmpassword);
  }
}
