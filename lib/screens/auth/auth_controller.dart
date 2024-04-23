import 'dart:async';
import 'dart:developer';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infrastructure/infrastructure.dart';

import '../../core/di/dependency_injector.dart';
import '../../messages/messages.dart';

class AuthController extends ChangeNotifier {
  final AuthUseCase _authUseCase;

  AuthController({required AuthUseCase authUseCase})
      : _authUseCase = authUseCase {
    log("=====================");
    DependencyInjector().getIt.registerSingleton(this);
    _getUser();
    log("AuthController init");
    log("=====================");
  }

  // Usuario actual
  MyUser? user;

  // Stream
  StreamController<MyUser?> streamUser = StreamController<MyUser?>();

  bool isInvalidCredentialException = false;

  // Obtener usuario
  Future<void> _getUser() async {
    try {
      user = await _authUseCase.getUser();

      streamUser.add(user);
    } catch (e) {
      streamUser.add(null);
    }
  }

  // Iniciar sesión con correo y contraseña
  Future<void> signInWithEmailAndPassword(BuildContext context,
      {required String userName, required String password}) async {
    Messages.showLoading(context);

    try {
      final user =
          await _authUseCase.logIn(userName: userName, password: password);

      if (!context.mounted) return;
      Navigator.popUntil(context, (route) => route.isFirst);

      // Inyectar usuario al stream
      this.user = user;
      streamUser.add(this.user);
      print('/////////////////////////////////////${user}');
    } catch (e) {
      log("$e");
      Navigator.pop(context);

      if (e is InvalidCredentialException) {
        isInvalidCredentialException = true;
        notifyListeners();
        return;
      }
      Messages.showError(context);
    }
  }

  //Resetear isInvalidCredentialException a false cuando se modifica alguno de los TextEditingController
  void resetInvalidCredentialException() {
    if (isInvalidCredentialException) {
      isInvalidCredentialException = false;
      notifyListeners();
    }
  }

  // Cerrar sesión
  Future<void> signOut() async {
    try {
      await _authUseCase.logOut();
      streamUser.add(null);
    } catch (e) {
      log("signOut => $e");
    }
  }

  @override
  void dispose() {
    log("=====================");
    DependencyInjector().getIt.unregister(instance: this);
    log("AuthController disposed");
    log("=====================");
    super.dispose();
  }
}

// No debe tener disposed
final authControllerProvider = ChangeNotifierProvider.autoDispose((ref) =>
    AuthController(authUseCase: DependencyInjector().getIt<AuthUseCase>()));
