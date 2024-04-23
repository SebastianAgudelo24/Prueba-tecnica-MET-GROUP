part of infrastructure;

abstract class AuthDataSource {
  Future<MyUser?> getUser();

  Future<MyUser> logIn({
    required String userName,
    required String password,
  });

  Future<void> logOut();
}
