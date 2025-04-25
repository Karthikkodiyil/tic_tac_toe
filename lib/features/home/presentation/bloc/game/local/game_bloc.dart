import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_toc_toe/core/constants/constants.dart';
import 'package:tic_toc_toe/features/home/domain/entity/game_box_entity.dart';
import 'package:tic_toc_toe/features/home/domain/usecase/get_box_usecase.dart';
import 'package:tic_toc_toe/features/home/presentation/bloc/game/local/game_event.dart';
import 'package:tic_toc_toe/features/home/presentation/bloc/game/local/game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GetBoxUsecase _getBoxUsecase;
  GameBloc(this._getBoxUsecase) : super(LocalGameDone(_getBoxUsecase.call())) {
    on<GameBoxEvent>((event, emit) {
      final list = _getBoxUsecase.call();
      emit(LocalGameDone(list));
    });
    on<EventO>((event, emit) async {
      int index = event.index!;
      List<GameBoxEntity> updatedList =
          List<GameBoxEntity>.from(state.gameList!);
      if (state.gameList![index].box != boxIcon) return;
      updatedList[index] = GameBoxEntity(box: oIcon);
      String? winner = checkWinCondition(updatedList, "o", state.numberOfPress);
      if (winner != "") {
        final list = _getBoxUsecase.call();
        emit(GameWinner(updatedList, state.pointO, state.pointX,
            winner, state.draw));
        await Future.delayed(const Duration(seconds: 3)).then((_) {
          emit(GameFinished(
            list,
            winner == "o" ? state.pointO + 1 : state.pointO,
            winner == "x" ? state.pointX + 1 : state.pointX,
            winner == "draw" ? state.draw + 1 : state.draw,
        
          ));
        });
      } else {
        emit(PressedO(state.pointO, state.pointX, winner, state.draw,
            updatedList, false, state.numberOfPress + 1));
      }
    });

    on<EventX>((event, emit) async {
      int index = event.index!;
      List<GameBoxEntity> updatedList =
          List<GameBoxEntity>.from(state.gameList!);
      if (state.gameList![index].box != boxIcon) return;
      updatedList[index] = GameBoxEntity(box: xIcon);
      String winner = checkWinCondition(updatedList, "x", state.numberOfPress);
      if (winner != "") {
        final list = _getBoxUsecase.call();
        emit(GameWinner( updatedList, state.pointO, state.pointX,
            winner, state.draw));
        await Future.delayed(const Duration(seconds: 3)).then((_) {
          emit(GameFinished(
            list,
            winner == "o" ? state.pointO + 1 : state.pointO,
            winner == "x" ? state.pointX + 1 : state.pointX,
            winner == "draw" ? state.draw + 1 : state.draw,
          
          ));
        });
      } else {
        emit(PressedX(state.pointO, state.pointX, winner, state.draw,
            updatedList, true, state.numberOfPress + 1));
      }
    });

    on<EventGameRestart>((event, emit) {
      final list = _getBoxUsecase.call();
      emit(GameRestart(list, state.pointX, state.pointO, state.draw));
    });
  }

  String checkWinCondition(
      List<GameBoxEntity> list, String isOplayer, int numberOfPress) {
    if (isOplayer == "o") {
      if (list[0].box == oIcon &&
          list[1].box == oIcon &&
          list[2].box == oIcon) {
        return "o";
      } else if (list[3].box == oIcon &&
          list[4].box == oIcon &&
          list[5].box == oIcon) {
        return "o";
      } else if (list[6].box == oIcon &&
          list[7].box == oIcon &&
          list[8].box == oIcon) {
        return "o";
      } else if (list[0].box == oIcon &&
          list[3].box == oIcon &&
          list[6].box == oIcon) {
        return "o";
      } else if (list[1].box == oIcon &&
          list[4].box == oIcon &&
          list[7].box == oIcon) {
        return "o";
      } else if (list[2].box == oIcon &&
          list[5].box == oIcon &&
          list[8].box == oIcon) {
        return "o";
      } else if (list[0].box == oIcon &&
          list[4].box == oIcon &&
          list[8].box == oIcon) {
        return "o";
      } else if (list[2].box == oIcon &&
          list[4].box == oIcon &&
          list[6].box == oIcon) {
        return "o";
      } else if (numberOfPress > 8) {
        return "draw";
      }
    } else {
      if (list[0].box == xIcon &&
          list[1].box == xIcon &&
          list[2].box == xIcon) {
        return "x";
      } else if (list[3].box == xIcon &&
          list[4].box == xIcon &&
          list[5].box == xIcon) {
        return "x";
      } else if (list[6].box == xIcon &&
          list[7].box == xIcon &&
          list[8].box == xIcon) {
        return "x";
      } else if (list[0].box == xIcon &&
          list[3].box == xIcon &&
          list[6].box == xIcon) {
        return "x";
      } else if (list[1].box == xIcon &&
          list[4].box == xIcon &&
          list[7].box == xIcon) {
        return "x";
      } else if (list[2].box == xIcon &&
          list[5].box == xIcon &&
          list[8].box == xIcon) {
        return "x";
      } else if (list[0].box == xIcon &&
          list[4].box == xIcon &&
          list[8].box == xIcon) {
        return "x";
      } else if (list[2].box == xIcon &&
          list[4].box == xIcon &&
          list[6].box == xIcon) {
        return "x";
      } else if (numberOfPress > 8) {
        return "draw";
      }
    }
    return "";
  }
}
