import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_toc_toe/core/constants/constants.dart';
import 'package:tic_toc_toe/core/utils/app_colors.dart';
import 'package:tic_toc_toe/core/utils/app_size.dart';
import 'package:tic_toc_toe/features/home/presentation/bloc/game/local/game_bloc.dart';
import 'package:tic_toc_toe/features/home/presentation/bloc/game/local/game_state.dart';
import 'package:tic_toc_toe/features/home/presentation/widget/float_button_widget.dart';
import 'package:tic_toc_toe/features/home/presentation/widget/game_box_widget.dart';
import 'package:tic_toc_toe/features/home/presentation/widget/point_row_widget.dart';
import 'package:tic_toc_toe/features/home/presentation/widget/turn_widget.dart';
import 'package:tic_toc_toe/features/home/presentation/widget/winner_alert_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      floatingActionButton: const FloatButtonWidget(),
      backgroundColor: kPrimColor,
      body: SafeArea(
          child: Container(
       // color: kWhite,
        decoration:const BoxDecoration(image: DecorationImage(image: AssetImage(homeBg),fit: BoxFit.fill)),
        child: Container(
          color: kGrey7,
          height: AppSize.screenHeight,
          width: AppSize.screenWidth,
          child: BlocConsumer<GameBloc, GameState>(
            builder: (BuildContext context, GameState state) {
              String turn = state.isOplayer ? "O" : "X";
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  25.kH,
                  const PointRowWidget(),
                  30.kH,
                  TurnWidget(turn: turn),
                  15.kH,
                  const GameBoxWidget(),
                ],
              );
            },
            listener: (BuildContext context, GameState state) {
              if (state.isGameFinished) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return WinnerAlertWidget(
                        winner: state.winner,
                      );
                    });
              }
            },
          ),
        ),
      )),
    );
  }
}
