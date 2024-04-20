import 'package:flutter/material.dart';
import 'package:prueba_programador_sebastian_agudelo/core/resource/images.dart';
import 'package:prueba_programador_sebastian_agudelo/routes/routes.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/widgets/app_bar/app_bar_bs.dart';

import '../../../theme/colors.dart';
import '../../widgets/button/btn_general.dart';
import '../../widgets/input/tff_general.dart';
import '../../widgets/input/tff_password.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 30, vertical: kToolbarHeight * 1),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarBs(),
                  Text(
                    'Registro',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 30),
                  const TffGeneral(labelText: 'Correo electrónico'),
                  const SizedBox(height: 20),
                  const TffPassword(labelText: 'Contraseña', error: false),
                  Image.asset(AppImages.register),
                  const Spacer(),
                  BtnGeneral(
                    text: 'Registrarse',
                    color: AppColors.primary,
                    fullWidth: true,
                    textColor: AppColors.black,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(AppRoutes.home),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
