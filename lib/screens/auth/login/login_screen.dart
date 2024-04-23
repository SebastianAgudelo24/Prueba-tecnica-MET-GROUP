import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_programador_sebastian_agudelo/core/extensions/validators.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/widgets/button/btn_general.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/widgets/button/btn_register.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/widgets/input/tff_general.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/widgets/input/tff_password.dart';
import 'package:prueba_programador_sebastian_agudelo/theme/colors.dart';

import '../auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController userName;
  late final TextEditingController password;

  @override
  void initState() {
    userName = TextEditingController();
    password = TextEditingController();
    ref.read(authControllerProvider).isInvalidCredentialException = false;
    super.initState();
  }

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final authController = ref.watch(authControllerProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 30, vertical: kToolbarHeight * 1.5),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Iniciar sesión',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 30),
                TffGeneral(
                  onChanged: (value) {
                    authController.resetInvalidCredentialException();
                  },
                  error: authController.isInvalidCredentialException,
                  labelText: 'Usuario',
                  controller: userName,
                ),
                const SizedBox(height: 20),
                TffPassword(
                  onChanged: (value) {
                    authController.resetInvalidCredentialException();
                  },
                  error: authController.isInvalidCredentialException,
                  labelText: 'Contraseña',
                  controller: password,
                  validator: (_) {
                    if (_ == null || _.length < 6) {
                      return "La contraseña debe tener mínimo 6 caracteres";
                    }
                  },
                ),
                const SizedBox(height: 10),
                authController.isInvalidCredentialException
                    ? Text(
                        'La combinación de usuario y contraseña que ingresaste es incorrecta. Por favor, inténtalo de nuevo',
                        style: textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.error,
                            fontWeight: FontWeight.w400))
                    : const SizedBox(),
                const SizedBox(height: 20),
                const Spacer(), // Espacio dinámico
                BtnGeneral(
                  text: 'Ingresar',
                  color: AppColors.primary,
                  fullWidth: true,
                  textColor: AppColors.black,
                  onPressed: () => authController.signInWithEmailAndPassword(
                      context,
                      userName: userName.text,
                      password: password.text),
                ),
                const SizedBox(height: 15),
                const Center(
                    // child: Btn_register(),
                    ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
