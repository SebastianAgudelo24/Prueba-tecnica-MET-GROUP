part of '../products_screen.dart';

class _Actions extends ConsumerStatefulWidget {
  final Store store;
  final Item item;
  final VoidCallback callback;

  const _Actions({
    super.key,
    required this.callback,
    required this.item,
    required this.store,
  });

  @override
  ConsumerState<_Actions> createState() => _ActionsState();
}

class _ActionsState extends ConsumerState<_Actions> {
  @override
  Widget build(BuildContext context) {
    final homeController = ref.watch(homeControllerProvider);
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
              onPressed: () =>
                  Messages.showEditItem(context, item: widget.item),
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
                onPressedAccept: () {
                  homeController.deleteItem(
                      id: widget.item.id, storeId: widget.store.id);
                  widget.callback();

                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
