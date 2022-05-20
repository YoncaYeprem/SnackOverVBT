import 'package:flutter/material.dart';

@immutable
class AppColors {
  final textColor = const Color(0xFF848484);
  final backgroundColor = const Color(0xFFf1f1f6);
  final darkPinkColor = const Color(0xFF9885b0);
  final lightPinkColor = const Color(0xFFfce7ff);
  final primaryColor = const Color(0xFFc9b5e2);
  final middlePink = const Color(0xFFC9B6E4);
  final softGrey = Colors.white54;
  final selectedColor = const Color(0xff08222e);
  final unselectedColor = const Color(0xff97b1c4);
  final darkGrey = const Color(0xFF6E7B8C);

  final pinkColor = const Color(0xFFDD3DE1);
  final purpleColor = const Color(0xFF6043B2);
  final darkPink = Color.fromARGB(255, 106, 53, 107);
  final darkPurpleColor = Color.fromARGB(255, 69, 49, 124);
  final profileTabBackgroundColor = const Color(0xFFEFF0F7);
  final profileTabBackgroundDarkColor = Color.fromARGB(255, 116, 116, 117);

  final lightAppbarColor = Colors.white;
  final darkAppbarColor = Colors.white54;
}

abstract class IColorTheme {
  AppColors get colors;

  Color? backgroundColor;
  Color? blackTextColor;
  Color? blueTextColor;
  Brightness? brightness;

  ColorScheme? colorScheme;
}
