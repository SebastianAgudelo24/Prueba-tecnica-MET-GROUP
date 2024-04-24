part of '../products_screen.dart';

class _ProductsAppBar extends StatefulWidget {
  const _ProductsAppBar({
    super.key,
    required this.store,
    required this.callback,
    required this.homeController,
  });
  final Store store;
  final VoidCallback callback;
  final HomeController homeController;
  @override
  State<_ProductsAppBar> createState() => _ProductsAppBarState();
}

class _ProductsAppBarState extends State<_ProductsAppBar> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final TextEditingController name;

  late final TextEditingController price;

  @override
  void initState() {
    name = TextEditingController();
    price = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    price.dispose();
    super.dispose();
  }

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
        onTap: () => Messages.showCreateItem(context,
            store: widget.store, name: name, price: price, onPressed: () {
          final double parsedPrice = double.tryParse(price.text) ?? 0.0;
          widget.homeController.createItem(
              storeId: widget.store.id, name: name.text, price: parsedPrice);
          widget.callback();

          Navigator.pop(context);
        }),
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
