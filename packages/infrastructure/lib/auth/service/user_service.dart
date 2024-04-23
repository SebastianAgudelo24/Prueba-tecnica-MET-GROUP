part of infrastructure;

class AuthService extends AuthDataSource {
  final authKey = 'authkey';
  final FlutterSecureStorage _flutterSecureStorage;

  AuthService({required FlutterSecureStorage flutterSecureStorage})
      : _flutterSecureStorage = flutterSecureStorage;

  @override
  Future<MyUser?> getUser() async {
    try {
      final data = await _flutterSecureStorage.read(key: authKey);
      if (data == null) return null;
      final dataDecode = jsonDecode(data);
      return UserModel.fromJson(dataDecode);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MyUser> logIn(
      {required String userName, required String password}) async {
    try {
      if (userName == 'Met' && password == '1234') {
        final user = UserModel(userName: userName, password: password);
        await _flutterSecureStorage.write(
            key: authKey, value: jsonEncode(user.toJson()));
        return user;
      } else {
        throw InvalidCredentialException();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _flutterSecureStorage.delete(key: authKey);
    } catch (e) {}
  }
}
