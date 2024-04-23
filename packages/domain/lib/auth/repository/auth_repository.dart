part of domain;

abstract class AuthRepository {
  Future<MyUser?> getUser();

  Future<MyUser> logIn({
    required String userName,
    required String password,
  });
  Future<void> logOut();
}
