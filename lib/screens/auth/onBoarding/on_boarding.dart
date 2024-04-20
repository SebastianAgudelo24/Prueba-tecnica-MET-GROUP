import 'package:flutter/material.dart';
import 'package:prueba_programador_sebastian_agudelo/core/resource/images.dart';
import 'package:prueba_programador_sebastian_agudelo/routes/routes.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/widgets/button/btn_general.dart';
import 'package:prueba_programador_sebastian_agudelo/theme/colors.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 30, vertical: kToolbarHeight * 1.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImages.onBoarding),
                const SizedBox(height: 50),
                Text(
                  '!Administra tus tiendas!',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  'Crea, administra y has seguimineto a tus comercios, todo esto en un solo lugar.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 20,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                BtnGeneral(
                  text: 'Siguiente',
                  fullWidth: true,
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoutes.login),
                )
              ],
            ),
          ),
        ));
  }
}
