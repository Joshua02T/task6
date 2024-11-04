import 'package:flutter/material.dart';

class MyFontSize {
  static const double baseWidth = 412;
  static const double baseHeight = 915;

  static double getFontWidth(BuildContext context, double size) {
    double screenWidth = MediaQuery.of(context).size.width;
    return (screenWidth / baseWidth) * size;
  }

  static double getFontHeight(BuildContext context, double size) {
    double screenHeight = MediaQuery.of(context).size.height;
    return (screenHeight / baseHeight) * size;
  }

  //width
  static double f12(BuildContext context) => getFontWidth(context, 12);
  static double f14(BuildContext context) => getFontWidth(context, 14);
  static double f16(BuildContext context) => getFontWidth(context, 16);
  static double f18(BuildContext context) => getFontWidth(context, 18);
  static double f20(BuildContext context) => getFontWidth(context, 20.6);
  static double f32(BuildContext context) => getFontWidth(context, 32);
  static double f44(BuildContext context) => getFontWidth(context, 44);

  //height
  static double f18h(BuildContext context) => getFontHeight(context, 18.3);
  static double f44h(BuildContext context) => getFontHeight(context, 44);
}
