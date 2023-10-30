class User {
  User({
    this.email,
    this.password,
  });

  String? email;
  String? password;

  factory User.fromJson(Map<String, dynamic>? json) {
    return User(
      email: json?['email'] as String?,
      password: json?['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
