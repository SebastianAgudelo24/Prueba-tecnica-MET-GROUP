import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class CustomCard extends StatelessWidget {
  final double? height;
  final double? borderRadius;
  final Widget widget;
  final double? paddingTop;
  const CustomCard({
    super.key,
    this.height,
    this.borderRadius,
    required this.widget,
    this.paddingTop,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 24),
      ),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 24),
              color: AppColors.white),
          width: MediaQuery.sizeOf(context).width,
          child: widget),
    );
  }
}
