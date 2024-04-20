import 'package:flutter/material.dart';
import 'package:prueba_programador_sebastian_agudelo/core/resource/images.dart';

import '../../../messages/messages.dart';

class ListileAppbar extends StatelessWidget {
  final String sectionTitle;
  const ListileAppbar({
    super.key,
    required this.sectionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: const CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(AppImages.avatar),
      ),
      trailing: IconButton(
          onPressed: () => Messages.showCreateStore(
                context,
                onPressed: () {},
              ),
          icon: const Icon(
            Icons.add_business_outlined,
            size: 30,
          )),
      title: Center(
          child: Text(sectionTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontSize: 23, fontWeight: FontWeight.w600))),
    );
  }
}
