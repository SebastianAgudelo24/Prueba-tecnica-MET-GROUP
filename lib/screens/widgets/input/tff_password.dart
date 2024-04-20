import 'package:flutter/material.dart';
import 'package:prueba_programador_sebastian_agudelo/theme/theme.dart';

import '../../../theme/colors.dart';

class TffPassword extends StatefulWidget {
  const TffPassword({
    Key? key,
    required this.labelText,
    this.controller,
    this.obscure = true,
    this.enable = true,
    this.onChanged,
    this.validator,
    this.focusNode,
    this.maxLines = 1,
    this.minLines,
    this.withHintText = false,
    this.fillColor = AppColors.white,
    required this.error,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool obscure;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool enable;
  final FocusNode? focusNode;
  final int? maxLines, minLines;
  final String labelText;
  final bool withHintText;
  final Color fillColor;
  final Color? focusedColor = AppColors.primary;
  final bool? error;

  @override
  State<TffPassword> createState() => _TffPasswordState();
}

class _TffPasswordState extends State<TffPassword> {
  late bool _obscure;

  @override
  void initState() {
    _obscure = widget.obscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: MyTheme.light,
      child: TextFormField(
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        focusNode: widget.focusNode,
        enabled: widget.enable,
        obscureText: _obscure,
        controller: widget.controller,
        validator: widget.validator,
        cursorColor: AppColors.black,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          labelStyle:
              const TextStyle(color: AppColors.defaultInput, fontSize: 16),
          fillColor: widget.fillColor,
          filled: true,
          isCollapsed: false,
          labelText: widget.withHintText ? null : widget.labelText,
          hintText: widget.withHintText ? widget.labelText : null,
          isDense: true,
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 60,
          ),
          suffixIcon: widget.error ?? false
              ? const Padding(
                  padding: EdgeInsets.only(right: 13),
                  child: Icon(Icons.error, color: AppColors.error),
                )
              : widget.obscure
                  ? Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkWell(
                          onTap: () => setState(() => _obscure = !_obscure),
                          child: _obscure
                              ? const Icon(Icons.visibility_off_outlined)
                              : const Icon(Icons.visibility_outlined)),
                    )
                  : null,
        ),
      ),
    );
  }
}
