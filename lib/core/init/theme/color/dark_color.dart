import 'package:flutter/src/material/color_scheme.dart';
import 'dart:ui';

import 'package:snack_over_vbt/core/init/theme/color/i_color.dart';

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
      onPrimary: colors.darkPinkColor,
      onSurface: colors.backgroundColor,
      onSecondary: colors.darkPinkColor,
      background: colors.darkGrey,
    );
  }
}
