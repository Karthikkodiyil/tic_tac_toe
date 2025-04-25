import 'package:flutter/material.dart';
import 'package:tic_toc_toe/core/utils/app_colors.dart';

class AppStyle {
  AppStyle._internal();

  static final AppStyle _instance = AppStyle._internal();

  factory AppStyle() {
    return _instance;
  }

  TextStyle _demoStyle(
    Color color,
    FontWeight fontWeight,
    double fontSize,
  ) {
    return TextStyle(
        fontFamily: "poppins",
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight);
  }

  TextStyle get blackBold22 => _demoStyle(kBlack, FontWeight.bold, 22);
  TextStyle get yellowBold18 => _demoStyle(kYellow, FontWeight.bold, 16);
    TextStyle get yellowBold22 => _demoStyle(kYellow, FontWeight.bold, 22);
  TextStyle get whiteSemi22 => _demoStyle(kWhite, FontWeight.w500, 22);
  TextStyle get blackSemi18 => _demoStyle(kBlack, FontWeight.w500, 18);
  TextStyle get primSemi24 => _demoStyle(kPrimColor, FontWeight.w500, 24);
  TextStyle get whiteSemi24 => _demoStyle(kWhite, FontWeight.w500, 24);
}
