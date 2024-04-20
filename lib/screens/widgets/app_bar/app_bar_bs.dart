import 'package:flutter/material.dart';

class AppBarBs extends StatelessWidget {
  const AppBarBs({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: title != null ? Text(title!) : null,
      trailing: IconButton(
        onPressed: Navigator.of(context).pop,
        icon: Icon(Icons.close, color: Theme.of(context).colorScheme.onSurface),
      ),
    );
  }
}
