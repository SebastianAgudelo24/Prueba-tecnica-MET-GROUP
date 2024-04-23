part of '../home_screen.dart';

class _ListileAppbar extends StatefulWidget {
  final String sectionTitle;
  final HomeController homeController;
  const _ListileAppbar({
    super.key,
    required this.sectionTitle,
    required this.homeController,
  });

  @override
  State<_ListileAppbar> createState() => _ListileAppbarState();
}

class _ListileAppbarState extends State<_ListileAppbar> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController name;

  @override
  void initState() {
    name = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: const CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(AppImages.avatar),
      ),
      trailing: IconButton(
          onPressed: () =>
              Messages.showCreateStore(context, name: name, onPressed: () {
                widget.homeController.createStore(name: name.text, items: []);
                widget.homeController.getStores();

                Navigator.pop(context);
              }),
          icon: const Icon(
            Icons.add_business_outlined,
            size: 30,
          )),
      title: Center(
          child: Text(widget.sectionTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontSize: 23, fontWeight: FontWeight.w600))),
    );
  }
}
