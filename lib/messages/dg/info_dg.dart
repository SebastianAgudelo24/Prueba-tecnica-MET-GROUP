part of '../messages.dart';

class _InfoDg extends StatelessWidget {
  const _InfoDg(
      {super.key,
      required this.title,
      this.message,
      this.callback,
      required this.image,
      this.needAcceptBtn,
      this.onPressedAccept});

  final String title, image;
  final String? message;
  final Function()? callback;
  final Function()? onPressedAccept;
  final bool? needAcceptBtn;

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
              Image.asset(image, height: 158),
              const SizedBox(height: 20),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontSize: 24, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              Visibility(
                  visible: message != null,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        message!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  )),
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
          needAcceptBtn ?? false
              ? TextButton(
                  onPressed: onPressedAccept,
                  child: Text(
                    'Aceptar',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
