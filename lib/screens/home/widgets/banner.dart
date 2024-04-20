part of '../home_screen.dart';

class _Banner extends StatelessWidget {
  const _Banner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      widget: Container(
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            image: const DecorationImage(
                image: AssetImage(AppImages.banner), fit: BoxFit.cover)),
      ),
    );
  }
}
