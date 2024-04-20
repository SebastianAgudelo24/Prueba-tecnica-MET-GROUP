part of '../store_screen.dart';

class _Actions extends StatelessWidget {
  final Function() editAction;
  final Function() deleteAction;
  const _Actions({
    super.key,
    required this.editAction,
    required this.deleteAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24),
            ),
          ),
          height: 50,
          width: 50,
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.mode_edit_outline_outlined),
              onPressed: () => Messages.showProductActions(context,
                  onPressed: () {}, isEditAction: true),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(24),
            ),
          ),
          height: 50,
          width: 50,
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => Messages.showInfo(
                context,
                title: 'Eliminar elemento',
                image: AppImages.delete,
                message: '¿Estas seguro que deseas eliminar este elemento?',
                needAcceptBtn: true,
                onPressedAccept: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
