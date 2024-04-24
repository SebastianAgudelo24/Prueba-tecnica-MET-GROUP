part of '../home_screen.dart';

class _StoreCard extends StatefulWidget {
  final Store store;
  final HomeController homeController;
  const _StoreCard({
    super.key,
    required this.store,
    required this.homeController,
  });

  @override
  State<_StoreCard> createState() => _StoreCardState();
}

class _StoreCardState extends State<_StoreCard> {
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductsScreen(
              callback: () => setState(() {
                print('//////////////SET STATE///////////');
              }),
              homeController: widget.homeController,
              store: widget.store,
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
              widget.store.name,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 20),
            ),
            subtitle: Text('Id: ${widget.store.id.substring(0, 3)}'),
          ),
        ),
      ),
    );
  }
}
