import 'dart:ui';

import 'package:flutter/src/material/color_scheme.dart';

import 'i_color.dart';

class LightColor implements IColorTheme {
  @override
  Color? backgroundColor;

  @override
  Color? blackTextColor;

  @override
  Color? blueTextColor;

  @override
  Brightness? brightness;

  @override
  ColorScheme? colorScheme;

  @override
  final AppColors colors = AppColors();

  LightColor() {
    backgroundColor = colors.backgroundColor;
    brightness = Brightness.light;
    blackTextColor = colors.textColor;
    colorScheme = const ColorScheme.light().copyWith(
      primary: colors.primaryColor,
      onPrimary: colors.lightPinkColor,
      onSurface: colors.backgroundColor,
      onSecondary: colors.darkPinkColor,
      background: colors.darkGrey,
    );
  }
}
