part of infrastructure;

class UserModel extends MyUser {
  UserModel({
    required super.userName,
    required super.password,
  });

  ///from json
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'],
      password: json['password'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['userNAme'] = userName;
    data['password'] = password;
    return data;
  }
}
