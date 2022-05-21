import 'dart:ui';

import 'package:flutter/src/material/color_scheme.dart';

import 'i_color.dart';

class DarkColor implements IColorTheme {
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

  DarkColor() {
    backgroundColor = colors.darkGrey;
    brightness = Brightness.dark;
    blackTextColor = colors.textColor;
    colorScheme = const ColorScheme.dark().copyWith(
      primary: colors.darkPinkColor,
      onPrimary: colors.darkPinkColor,
      onSurface: colors.backgroundColor,
      onSecondary: colors.darkPinkColor,
      background: colors.darkGrey,
      outline: colors.softGrey,
      primaryContainer: colors.darkPink,
      secondaryContainer: colors.darkPurpleColor,
      onTertiary: colors.profileTabBackgroundDarkColor,
      onBackground: colors.darkAppbarColor,
    );
  }
}
