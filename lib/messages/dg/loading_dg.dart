part of "../messages.dart";

class _LoadingDg extends StatelessWidget {
  const _LoadingDg({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          backgroundColor: Colors.transparent,
          child: const Center(child: LoadingGeneral()),
        ),
      ),
    );
  }
}
