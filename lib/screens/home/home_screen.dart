import 'package:flutter/material.dart';
import 'package:prueba_programador_sebastian_agudelo/core/resource/images.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/Store/store_screen.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/widgets/app_bar/listile_app_bar.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/widgets/card/custom_card.dart';

part 'widgets/store_card.dart';
part 'widgets/banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String name = 'Tienda';

    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: kToolbarHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const ListileAppbar(
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
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const _StoreCard(name: name);
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
