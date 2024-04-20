import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/widgets/button/btn_general.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/widgets/input/tff_general.dart';

import '../core/resource/images.dart';
import '../screens/widgets/loading/loading_general.dart';
import '../theme/colors.dart';

part 'dg/loading_dg.dart';
part 'dg/no_wifi_dg.dart';
part 'dg/info_dg.dart';
part 'dg/error_dg.dart';
part 'dg/product_actions_dg.dart';
part 'dg/create_store_dg.dart';

abstract class Messages {
  // Cargando
  static void showLoading(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const _LoadingDg(),
      );

  // Productos
  static void showProductActions(BuildContext context,
          {required VoidCallback onPressed,
          required bool isEditAction,
          VoidCallback? navigateToSettings}) =>
      showModalBottomSheet(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          useSafeArea: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          enableDrag: true,
          builder: (context) => _ProductActionsDg(
                isEditAction: isEditAction,
                onPressed: onPressed,
              ));
  // Productos
  static void showCreateStore(BuildContext context,
          {required VoidCallback onPressed,
          VoidCallback? navigateToSettings}) =>
      showModalBottomSheet(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          useSafeArea: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          enableDrag: true,
          builder: (context) => _CreateStoreDg(
                onPressed: onPressed,
              ));

  // Mostrar información
  static void showInfo(BuildContext context,
          {required String title,
          String message = '',
          required String image,
          Function()? callback,
          Function()? onPressedAccept,
          bool needAcceptBtn = false}) =>
      showDialog(
        barrierColor: const Color(0xFF999970).withAlpha(44),
        context: context,
        builder: (context) => Stack(
          children: [
            // Fondo desenfocado
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(color: Colors.transparent),
            ),
            // Contenido del dialog
            Center(
              child: _InfoDg(
                title: title,
                message: message,
                callback: callback,
                image: image,
                needAcceptBtn: needAcceptBtn,
                onPressedAccept: onPressedAccept,
              ),
            ),
          ],
        ),
      );
  // Mostrar información

  static void showError(
    BuildContext context, {
    Function()? callback,
  }) =>
      showDialog(
        barrierColor: const Color(0xFF999970).withAlpha(44),
        context: context,
        builder: (context) => Stack(
          children: [
            // Fondo desenfocado
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(color: Colors.transparent),
            ),
            // Contenido del dialog
            Center(
              child: _ErrorDg(
                callback: callback,
              ),
            ),
          ],
        ),
      );
}
