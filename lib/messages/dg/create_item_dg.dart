part of '../messages.dart';

class _CreateItemDg extends ConsumerStatefulWidget {
  final Store store;
  final VoidCallback onPressed;
  final TextEditingController name;
  final TextEditingController price;
  const _CreateItemDg({
    super.key,
    required this.name,
    required this.price,
    required this.onPressed,
    required this.store,
  });

  @override
  ConsumerState<_CreateItemDg> createState() => _CreateItemDgState();
}

class _CreateItemDgState extends ConsumerState<_CreateItemDg> {
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
              title: Text(
                'Creacion de produto',
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
                    TffGeneral(labelText: 'name', controller: widget.name),
                    const SizedBox(height: 15),
                    TffGeneral(labelText: 'price', controller: widget.price),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.35),
                    BtnGeneral(
                      text: 'Crear item',
                      fullWidth: true,
                      color: AppColors.primary,
                      onPressed: widget.onPressed,
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
