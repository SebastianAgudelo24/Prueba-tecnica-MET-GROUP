part of '../products_screen.dart';

class _ProductList extends ConsumerStatefulWidget {
  final Store store;
  final VoidCallback callback;
  const _ProductList({
    super.key,
    required this.callback,
    required this.store,
  });

  @override
  ConsumerState<_ProductList> createState() => _ProductListState();
}

class _ProductListState extends ConsumerState<_ProductList> {
  @override
  Widget build(BuildContext context) {
    final homeController = ref.watch(homeControllerProvider);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.77,
      child: FutureBuilder(
        future: homeController.getStores(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || snapshot.data == null) {
            return const Center(
              child: Text('Sin conexion a internet'),
            );
          }

          if (widget.store.items.isEmpty) {
            return const Center(child: Text('No hay productos'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: widget.store.items.length,
            itemBuilder: (context, index) {
              final item = widget.store.items[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                height: 110,
                child: CustomCard(
                    widget: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Id: ${item.id.substring(0, 3)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Precio',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                            ),
                            Text(
                              item.price.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        _Actions(
                          store: widget.store,
                          item: item,
                          callback: widget.callback,
                        )
                      ]),
                )),
              );
            },
          );
        },
      ),
    );
  }
}
