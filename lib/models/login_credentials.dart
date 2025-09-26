class LoginCredentials {
  final String email;
  final String password;

  LoginCredentials({required this.email, required this.password,});

  // maybe we need
  Map<String, dynamic> toMap()  {
    return  {
      'email': email,
      'password': password,
    };
  }
}