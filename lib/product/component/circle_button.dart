import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton(
      {Key? key,
      required this.icon,
      required this.height,
      required this.color,
      required this.onPressed,
      this.iconColor,
      this.padding})
      : super(key: key);

  final IconData icon;
  final double height;
  final Color color;
  final VoidCallback onPressed;
  final Color? iconColor;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(shape: const CircleBorder(), primary: color, minimumSize: Size.zero),
      child: SizedBox(
        height: height,
        child: FittedBox(
          child: Padding(
            padding: padding ?? context.paddingLow,
            child: Icon(icon, color: iconColor),
          ),
        ),
      ),
    );
  }
}
