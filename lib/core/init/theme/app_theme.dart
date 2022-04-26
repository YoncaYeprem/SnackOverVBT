// THEME
import 'package:flutter/material.dart';
import 'package:snack_over_vbt/core/init/theme/text/dark_theme.dart';
import 'package:snack_over_vbt/core/init/theme/text/i_text_theme.dart';
import 'package:snack_over_vbt/core/init/theme/text/light_text.dart';

import 'color/dark_color.dart';
import 'color/i_color.dart';
import 'color/light_color.dart';

abstract class ITheme {
  ITextTheme get textTheme;
  IColorTheme get colorTheme;
}

class AppThemeLight extends ITheme {
  @override
  IColorTheme get colorTheme => LightColor();

  @override
  ITextTheme get textTheme => LightTextTheme();
}

class DarkThemeLight extends ITheme {
  @override
  IColorTheme get colorTheme => DarkColor();

  @override
  ITextTheme get textTheme => DarkTextTheme(colorTheme.colorScheme?.onSurface.withOpacity(0.4));
}

//
abstract class ThemeManager {
  static ThemeData createTheme(ITheme theme) {
    return ThemeData(
      toggleableActiveColor: const Color(0xffe53935),
      bannerTheme: MaterialBannerThemeData(
          contentTextStyle: theme.textTheme.headline4?.copyWith(color: theme.colorTheme.colorScheme?.background),
          backgroundColor: theme.colorTheme.colorScheme?.onPrimary),
      dialogTheme: DialogTheme(
        titleTextStyle: theme.textTheme.headline4
            ?.copyWith(color: theme.colorTheme.colorScheme?.onPrimary, fontWeight: FontWeight.bold),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: theme.colorTheme.colors.darkPinkColor),
      appBarTheme: AppBarTheme(
          color: theme.colorTheme.colors.backgroundColor,
          titleTextStyle: theme.textTheme.headline4
              ?.copyWith(color: theme.colorTheme.colorScheme?.onPrimary, fontWeight: FontWeight.bold)),
      fontFamily: theme.textTheme.fontFamily,
      textTheme: _textTheme(theme),
      scaffoldBackgroundColor: theme.colorTheme.backgroundColor,
      colorScheme: theme.colorTheme.colorScheme?.copyWith(),
    );
  }

  static TextTheme _textTheme(ITheme theme) {
    return TextTheme(
        headline1: theme.textTheme.headline1,
        headline2: theme.textTheme.headline2,
        headline3: theme.textTheme.headline3,
        headline4: theme.textTheme.headline4,
        headline5: theme.textTheme.headline5,
        headline6: theme.textTheme.headline6,
        bodyText1: theme.textTheme.bodyText1,
        bodyText2: theme.textTheme.bodyText2);
  }
}
