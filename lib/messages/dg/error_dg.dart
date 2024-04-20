part of '../messages.dart';

class _ErrorDg extends StatelessWidget {
  const _ErrorDg({
    super.key,
    this.callback,
  });

  final Function()? callback;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        content: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppImages.error, height: 158),
              const SizedBox(height: 20),
              Text(
                'Ups! Ha ocurrido un error',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontSize: 24, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Algo ha slido mal, por favor intentalo mas tarde',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: callback ?? Navigator.of(context).pop,
            child: Text(
              'Cerrar',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
