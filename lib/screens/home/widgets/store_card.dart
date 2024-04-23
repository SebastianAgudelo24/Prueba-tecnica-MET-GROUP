part of '../home_screen.dart';

class _StoreCard extends StatelessWidget {
  final HomeController homeController;
  final Store store;

  const _StoreCard({
    super.key,
    required this.store,
    required this.homeController,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductsScreen(
              store: store,
              homeController: homeController,
            ),
          ),
        );
      },
      child: CustomCard(
        widget: SizedBox(
          height: 100,
          child: ListTile(
            minVerticalPadding: 30,
            trailing: Image.asset(AppImages.register),
            title: Text(
              store.name,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 20),
            ),
            subtitle: Text('Id: ${store.id.substring(0, 3)}'),
          ),
        ),
      ),
    );
  }
}
