part of infrastructure;

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImpl(this._authDataSource);

  @override
  Future<MyUser?> getUser() => _authDataSource.getUser();

  @override
  Future<MyUser> logIn({required String userName, required String password}) =>
      _authDataSource.logIn(
        userName: userName,
        password: password,
      );

  @override
  Future<void> logOut() => _authDataSource.logOut();
}
