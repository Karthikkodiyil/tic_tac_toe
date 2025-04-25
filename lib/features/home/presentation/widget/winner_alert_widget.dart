import 'package:flutter/material.dart';
import 'package:tic_toc_toe/core/utils/app_style.dart';

class WinnerAlertWidget extends StatelessWidget {
  final String winner;
  const WinnerAlertWidget({super.key, required this.winner});

  @override
  AlertDialog build(BuildContext context) {
    AppStyle style = AppStyle();
    return AlertDialog(
      content: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            winner != "draw"
                ? RichText(
                    text: TextSpan(children: [
                    TextSpan(text: winner, style: style.blackBold22),
                    TextSpan(text: "  Wins the match", style: style.blackSemi18)
                  ]))
                : Text("The match was Draw", style: style.blackSemi18)
          ],
        ),
      ),
    );
  }
}
