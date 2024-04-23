import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/home/home_controller.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/widgets/card/custom_card.dart';
import '../../core/resource/images.dart';
import '../../messages/messages.dart';
import '../../theme/colors.dart';

part 'widgets/actions.dart';
part 'widgets/product_list.dart';
part 'widgets/products_app_bar.dart';

class ProductsScreen extends StatelessWidget {
  final HomeController homeController;

  final Store store;
  const ProductsScreen({
    super.key,
    required this.homeController,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 30, vertical: kToolbarHeight * 0.8),
        child: Column(
          children: [
            _ProductsAppBar(
              store: store,
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
            _ProductList(store: store)
          ],
        ),
      ),
    );
  }
}
