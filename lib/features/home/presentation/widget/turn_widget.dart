
import 'package:flutter/material.dart';
import 'package:tic_toc_toe/core/utils/app_style.dart';

class TurnWidget extends StatelessWidget {
  const TurnWidget({
    super.key,
    required this.turn,
  });

  final String turn;

  @override
  Widget build(BuildContext context) {
    AppStyle style = AppStyle();
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: "It's  ",
        style: style.yellowBold22,
      ),
      TextSpan(text: "$turn's", style: style.whiteSemi24),
      TextSpan(
        text: "  turn !",
        style: style.yellowBold22,
      )
    ]));
  }
}