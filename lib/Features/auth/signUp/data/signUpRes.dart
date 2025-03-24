class SignUpResSuccess {
  final String token;
  final String username;

  SignUpResSuccess({required this.token, required this.username});
  factory SignUpResSuccess.fromJson(json) => SignUpResSuccess(
        token: json['token'],
        username: json['username'],
      );
}

class SignUpResFailure {
  final String email;
  final String password;
  final String name;
  final String phone;

  SignUpResFailure(
      {required this.email,
      required this.password,
      required this.name,
      required this.phone});
  factory SignUpResFailure.fromJson(json) => SignUpResFailure(
        email: json['email'] == null ? '' : json['email'][0],
        password: json['password'] == null ? '' : json['password'][0],
        name: json['name'] == null ? '' : json['name'][0],
        phone: json['phone'] == null ? '' : json['phone'][0],
      );
}
