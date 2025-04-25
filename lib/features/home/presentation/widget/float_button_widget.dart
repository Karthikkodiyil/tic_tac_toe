import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_toc_toe/core/utils/app_colors.dart';
import 'package:tic_toc_toe/features/home/presentation/bloc/game/local/game_bloc.dart';
import 'package:tic_toc_toe/features/home/presentation/bloc/game/local/game_event.dart';
import 'package:tic_toc_toe/features/home/presentation/bloc/game/local/game_state.dart';

class FloatButtonWidget extends StatelessWidget {
  const FloatButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(builder: (context, state) {
      return FloatingActionButton(
        onPressed: () {
          context.read<GameBloc>().add(EventGameRestart());
        },
        backgroundColor: kPrimColor,
        child: const Icon(
          Icons.refresh,
          color: kWhite,
          size: 29,
        ),
      );
    });
  }
}
