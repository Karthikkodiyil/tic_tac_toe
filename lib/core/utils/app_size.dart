import 'package:flutter/material.dart';

class AppSize {
 static double screenWidth = 0;
  static double screenHeight = 0;
  static double bottomInset = 0;

  void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenHeight = mediaQuery.size.height;
    screenWidth = mediaQuery.size.width;
    bottomInset = mediaQuery.viewInsets.bottom;
  }
}


extension IntExtension on int? {
  int validate({int value = 0}) {
    return this ?? value;
  }

  Widget get kH => SizedBox(
        height: this?.toDouble(),
      );
  Widget get kW => SizedBox(
        width: this?.toDouble(),
      );
}

