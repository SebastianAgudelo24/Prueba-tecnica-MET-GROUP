import 'package:flutter/material.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/widgets/card/custom_card.dart';
import '../../core/resource/images.dart';
import '../../messages/messages.dart';
import '../../theme/colors.dart';

part 'widgets/actions.dart';

class StoreScreen extends StatelessWidget {
  final String storeName;
  const StoreScreen({super.key, required this.storeName});

  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(name: 'Papas', price: '\$50.000', id: '1'),
      Item(name: 'Carne', price: '\$50.000', id: '2'),
      Item(name: 'Salmon', price: '\$50.000', id: '3'),
      Item(name: 'Atun', price: '\$50.000', id: '4'),
      Item(name: 'Atun', price: '\$50.000', id: '4'),
      Item(name: 'Atun', price: '\$50.000', id: '4'),
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 30, vertical: kToolbarHeight * 0.8),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                storeName,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_rounded)),
              trailing: InkWell(
                onTap: () => Messages.showProductActions(context,
                    onPressed: () {}, isEditAction: false),
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
            ),
            const SizedBox(height: 15),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Productos',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 25, fontWeight: FontWeight.w700),
                )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.77,
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final Item item = items[index];
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
                                  'Id: ${item.id}',
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
                                  item.price,
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
                              deleteAction: () {},
                              editAction: () {},
                            ),
                          ]),
                    )),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Item {
  final String name;
  final String price;
  final String id;

  Item({
    required this.name,
    required this.price,
    required this.id,
  });
}
