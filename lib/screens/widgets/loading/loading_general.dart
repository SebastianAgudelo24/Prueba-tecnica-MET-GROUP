import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingGeneral extends StatelessWidget {
  const LoadingGeneral({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: CupertinoActivityIndicator(
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }
}
