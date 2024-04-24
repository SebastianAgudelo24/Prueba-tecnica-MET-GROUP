import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_programador_sebastian_agudelo/core/resource/images.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/Store/products_screen.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/home/home_controller.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/widgets/card/custom_card.dart';

import '../../messages/messages.dart';

part 'widgets/store_card.dart';
part 'widgets/banner.dart';
part 'widgets/listile_app_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeController = ref.watch(homeControllerProvider);

    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: kToolbarHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _ListileAppbar(
              callback: () => setState(() {}),
              homeController: homeController,
              sectionTitle: 'Tiendas',
            ),
            const SizedBox(height: 20),
            const _Banner(),
            const SizedBox(height: 25),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Tiendas creadas 🤩',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.55,
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

                    final stores = snapshot.data!;

                    if (stores.isEmpty) {
                      return const Center(child: Text('No hay tiendas'));
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemCount: stores.length,
                      itemBuilder: (context, index) {
                        final store = stores[index];
                        return _StoreCard(
                          homeController: homeController,
                          store: store,
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
