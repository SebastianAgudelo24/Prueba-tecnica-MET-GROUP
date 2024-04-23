part of domain;

abstract class MyUser {
  final String userName;
  final String password;

  MyUser({
    required this.userName,
    required this.password,
  });

  //To Json
  Map<String, dynamic> toJson();
}
