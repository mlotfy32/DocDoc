class LoginResModelSuccess {
  final String token;
  final String username;

  LoginResModelSuccess({required this.token, required this.username});
  factory LoginResModelSuccess.fromJson(json) => LoginResModelSuccess(
        token: json['token'],
        username: json['username'],
      );
}

class LoginResModelFailure {
  final String message;

  LoginResModelFailure({required this.message});
  factory LoginResModelFailure.fromJson(json) => LoginResModelFailure(
        message: json['message'],
      );
}
