part of '../home_screen.dart';

class _StoreCard extends StatelessWidget {
  const _StoreCard({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StoreScreen(storeName: name),
        ),
      ),
      child: CustomCard(
        widget: SizedBox(
          height: 100,
          child: ListTile(
            minVerticalPadding: 30,
            trailing: Image.asset(AppImages.register),
            title: Text(
              'Name',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 20),
            ),
            subtitle: const Text('Id: ${1234}'),
          ),
        ),
      ),
    );
  }
}
