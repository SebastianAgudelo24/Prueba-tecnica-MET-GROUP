part of '../messages.dart';

class _EditItemDg extends ConsumerStatefulWidget {
  final Item item;
  const _EditItemDg({
    super.key,
    required this.item,
  });

  @override
  ConsumerState<_EditItemDg> createState() => _EditItemDgState();
}

class _EditItemDgState extends ConsumerState<_EditItemDg> {
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
    final homeController = ref.watch(homeControllerProvider);
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
              title: Text(
                'Edicion de produto',
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
                    TffGeneral(labelText: 'name', controller: name),
                    const SizedBox(height: 15),
                    TffGeneral(labelText: 'price', controller: price),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.35),
                    BtnGeneral(
                        text: 'Editar item',
                        fullWidth: true,
                        color: AppColors.primary,
                        onPressed: () {
                          homeController.editItem(
                              id: widget.item.id,
                              newName: name.text,
                              newPrice: double.tryParse(price.text) ?? 0.0);
                          Navigator.pop(context);
                        })
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
