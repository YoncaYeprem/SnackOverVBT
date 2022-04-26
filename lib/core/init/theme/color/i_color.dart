import 'package:flutter/material.dart';

@immutable
class AppColors {
  final textColor = const Color(0xFF848484);
  final backgroundColor = const Color(0xFFFff0f7);
  final darkPinkColor = const Color(0xFFF40754);
  final lightPinkColor = const Color(0xFFFBD6D2);
  final darkGrey = const Color(0xFF6E7B8C);
}

abstract class IColorTheme {
  AppColors get colors;

  Color? backgroundColor;
  Color? blackTextColor;
  Color? blueTextColor;
  Brightness? brightness;

  ColorScheme? colorScheme;
}
