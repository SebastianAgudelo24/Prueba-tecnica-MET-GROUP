import 'package:flutter/cupertino.dart';

import '../../../theme/colors.dart';

class BtnGeneral extends StatefulWidget {
  const BtnGeneral({
    Key? key,
    required this.text,
    this.onPressed,
    this.color = AppColors.white,
    this.textColor = AppColors.black,
    this.fullWidth = false,
    this.onPressedColor, // Nuevo parámetro
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final Color color, textColor;
  final Color? onPressedColor;
  final bool fullWidth; // Nuevo parámetro

  @override
  State<BtnGeneral> createState() => _BtnGeneralState();
}

class _BtnGeneralState extends State<BtnGeneral> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isPressed = false;
        });
        widget.onPressed?.call();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: widget.fullWidth ? double.infinity : null, // Nuevo código
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
          decoration: BoxDecoration(
            color: _isPressed
                ? widget.onPressedColor ?? AppColors.primary.withOpacity(0.5)
                : widget.color,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(color: widget.textColor),
          ),
        ),
      ),
    );
  }
}
