import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

import 'i_text_theme.dart';

class DarkTextTheme implements ITextTheme {
  @override
  TextStyle? bodyText1;

  @override
  TextStyle? bodyText2;

  @override
  String? fontFamily;

  @override
  TextStyle? headline1;

  @override
  TextStyle? headline2;

  @override
  TextStyle? headline3;

  @override
  TextStyle? headline4;

  @override
  TextStyle? headline5;

  @override
  TextStyle? headline6;

  @override
  TextStyle? subtitle2;

  @override
  final Color? primarColor;
  DarkTextTheme(this.primarColor) {
    fontFamily = GoogleFonts.ubuntu().fontFamily;

    headline1 = const TextStyle(
      fontSize: 55,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    );
    headline2 = const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
    headline3 = const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
    headline4 = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
    headline5 = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
    headline6 = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );

    bodyText1 = const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
    bodyText2 = const TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }
}
