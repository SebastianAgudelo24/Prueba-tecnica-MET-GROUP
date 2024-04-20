import 'package:flutter/material.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/widgets/button/btn_general.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/widgets/button/btn_register.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/widgets/input/tff_general.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/widgets/input/tff_password.dart';
import 'package:prueba_programador_sebastian_agudelo/theme/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                const TffGeneral(labelText: 'Correo electrónico'),
                const SizedBox(height: 20),
                const TffPassword(labelText: 'Contraseña', error: false),
                const SizedBox(height: 20),
                const Spacer(), // Espacio dinámico
                BtnGeneral(
                  text: 'Ingresar',
                  color: AppColors.primary,
                  fullWidth: true,
                  textColor: AppColors.black,
                  onPressed: () {},
                ),
                const SizedBox(height: 15),
                const Center(
                  child: Btn_register(),
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
