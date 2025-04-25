import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_toc_toe/core/utils/app_colors.dart';
import 'package:tic_toc_toe/features/home/presentation/bloc/game/local/game_bloc.dart';
import 'package:tic_toc_toe/features/home/presentation/bloc/game/local/game_event.dart';
import 'package:tic_toc_toe/features/home/presentation/bloc/game/local/game_state.dart';

class GameBoxWidget extends StatelessWidget {
  const GameBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GameBloc>();
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: BlocBuilder<GameBloc, GameState>(builder: (_, state) {
        return SizedBox(
          height: 450,
          child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.gameList!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 15, crossAxisSpacing: 15, crossAxisCount: 3),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    state.isGameFinished
                        ? () {}
                        : state.isOplayer
                            ? bloc.add(EventO(index))
                            : bloc.add(EventX(index));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: kBlack, borderRadius: BorderRadius.circular(15)),
                    child: Image.asset(state.gameList![index].box),
                  ),
                );
              }),
        );
      }),
    );
  }
}
