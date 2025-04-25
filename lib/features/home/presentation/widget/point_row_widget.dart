import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_toc_toe/core/utils/app_colors.dart';
import 'package:tic_toc_toe/core/utils/app_style.dart';
import 'package:tic_toc_toe/features/home/presentation/bloc/game/local/game_bloc.dart';
import 'package:tic_toc_toe/features/home/presentation/bloc/game/local/game_state.dart';

class PointRowWidget extends StatelessWidget {
  const PointRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SingleContainerWidget(
            point: state.pointX,
            name: 'Point of X',
          ),
          _SingleContainerWidget(
            point: state.draw,
            name: 'Draw',
          ),
          _SingleContainerWidget(
            point: state.pointO,
            name: 'Point of O',
          ),
        ],
      );
    });
  }
}

class _SingleContainerWidget extends StatelessWidget {
  final int point;
  final String name;
  const _SingleContainerWidget({required this.point, required this.name});

  @override
  Widget build(BuildContext context) {
    AppStyle style = AppStyle();
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            kGrey7,
            kPrimColor,
            kWhite,
          ]),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
              color: kWhite, borderRadius: BorderRadius.circular(20)),
          child: Container(
            decoration: BoxDecoration(
                color: kGrey7, borderRadius: BorderRadius.circular(20)),
            height: 80,
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: style.yellowBold18,
                ),
                Text(
                  "$point",
                  style: style.whiteSemi22,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
