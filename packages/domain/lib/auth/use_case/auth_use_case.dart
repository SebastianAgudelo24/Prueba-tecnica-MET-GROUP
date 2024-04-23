part of domain;

class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<MyUser?> getUser() {
    return _authRepository.getUser();
  }

  Future<MyUser> logIn({
    required String userName,
    required String password,
  }) {
    return _authRepository.logIn(
      userName: userName,
      password: password,
    );
  }

  Future<void> logOut() {
    return _authRepository.logOut();
  }
}
