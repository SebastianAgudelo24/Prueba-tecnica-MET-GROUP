part of '../products_screen.dart';

class _ProductsAppBar extends StatefulWidget {
  const _ProductsAppBar({
    super.key,
    required this.store,
  });
  final Store store;

  @override
  State<_ProductsAppBar> createState() => _ProductsAppBarState();
}

class _ProductsAppBarState extends State<_ProductsAppBar> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        widget.store.name,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_rounded)),
      trailing: InkWell(
        onTap: () => Messages.showCreateItem(context, store: widget.store),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Agregar producto',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 5),
            const Icon(Icons.add_outlined)
          ],
        ),
      ),
    );
  }
}
