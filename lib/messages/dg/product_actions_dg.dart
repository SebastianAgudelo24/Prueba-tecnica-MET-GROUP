part of '../messages.dart';

class _ProductActionsDg extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isEditAction;
  const _ProductActionsDg({
    super.key,
    required this.onPressed,
    required this.isEditAction,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(fontSize: 25, fontWeight: FontWeight.w400);
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: const EdgeInsetsDirectional.all(0),
              title: isEditAction
                  ? Text(
                      'Edicion de produto',
                      style: titleStyle,
                    )
                  : Text(
                      'Creación de producto',
                      style: titleStyle,
                    ),
              trailing: const Icon(Icons.shopping_bag_outlined),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Form(
                child: Column(
                  children: [
                    const TffGeneral(labelText: 'name'),
                    const SizedBox(height: 15),
                    const TffGeneral(labelText: 'price'),
                    const SizedBox(height: 15),
                    const TffGeneral(labelText: 'id'),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.35),
                    const BtnGeneral(
                      text: 'Crear item',
                      fullWidth: true,
                      color: AppColors.primary,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
