import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../theme/colors.dart';
import '../../../theme/theme.dart';
// import 'package:koolcard/theme/color.dart';

class TffGeneral extends StatelessWidget {
  const TffGeneral({
    Key? key,
    required this.labelText,
    this.helperText,
    this.controller,
    this.onlyNumbers = false,
    this.enable = true,
    this.readOnly = false,
    this.onChanged,
    this.validator,
    this.maxLines = 1,
    this.minLines,
    this.onTap,
    this.withHintText = false,
    this.labelStyle,
    this.error,
    this.fillColor = AppColors.white,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool onlyNumbers;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool enable;
  final int? maxLines, minLines;
  final String labelText;
  final String? helperText;
  final bool readOnly;
  final void Function()? onTap;
  final bool withHintText;
  final TextStyle? labelStyle;
  final Color fillColor;
  final bool? error;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: MyTheme
          .light, // O MyTheme.dark dependiendo del tema que quieras aplicar
      child: TextFormField(
        maxLines: maxLines,
        minLines: minLines,
        readOnly: readOnly,
        onTap: onTap,
        enabled: enable,
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        cursorColor: MyTheme.light.colorScheme.primary,
        inputFormatters:
            onlyNumbers ? [FilteringTextInputFormatter.digitsOnly] : null,
        decoration: InputDecoration(
          labelStyle:
              const TextStyle(color: AppColors.defaultInput, fontSize: 16),
          suffixIcon: error ?? false
              ? const Icon(
                  Icons.error,
                  color: AppColors.error,
                )
              : const SizedBox(),
          fillColor: AppColors.white,
          filled: true,
          isCollapsed: false,
          labelText: withHintText ? null : labelText,
          hintStyle: MyTheme.light.textTheme.titleLarge,
          hintText: withHintText ? labelText : null,
          helperText: helperText,
          isDense: true,
          focusColor: MyTheme.light.inputDecorationTheme.focusColor,
        ),
      ),
    );
  }
}
