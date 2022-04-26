import 'package:flutter/material.dart';

abstract class ITextTheme {
  final Color? primarColor;
  TextStyle? headline1;
  TextStyle? headline2;
  TextStyle? headline3;
  TextStyle? headline4;
  TextStyle? headline5;
  TextStyle? headline6;
  TextStyle? bodyText1;
  TextStyle? bodyText2;
  TextStyle? subtitle2;

  String? fontFamily;

  ITextTheme(this.primarColor);
}
