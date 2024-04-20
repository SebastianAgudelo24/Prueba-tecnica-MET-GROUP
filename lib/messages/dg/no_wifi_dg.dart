part of '../messages.dart';

class _NoWifiDg extends StatelessWidget {
  const _NoWifiDg({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title: Text(
          "Sin conexión a internet",
          textAlign: TextAlign.center,
          style: TextStyle(color: colors.primary),
        ),
        content: SizedBox(
            height: 180,
            child: Image.asset(AppImages.noWifi, fit: BoxFit.contain)),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text("Aceptar"),
          ),
        ],
      ),
    );
  }
}
