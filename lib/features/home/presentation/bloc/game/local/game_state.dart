import 'package:equatable/equatable.dart';
import 'package:tic_toc_toe/features/home/domain/entity/game_box_entity.dart';

abstract class GameState extends Equatable {
  final List<GameBoxEntity>? gameList;
  final bool isOplayer;
  final int pointO;
  final int pointX;
  final int draw;
  final String winner;
  final int numberOfPress;
  final bool isGameFinished;

  const GameState( {
    this.gameList,
    this.isOplayer = false,
    this.pointO = 0,
    this.draw = 0,
    this.pointX = 0,
    this.winner = "",
    this.numberOfPress = 1,
    this.isGameFinished = false,
  });
  @override
  List<Object?> get props =>
      [gameList, isOplayer, pointO, pointX, draw, winner];
}

class LocalGameDone extends GameState {
  const LocalGameDone(List<GameBoxEntity> list)
      : super(gameList: list, isOplayer: false);
}

class PressedO extends GameState {
  const PressedO(int pointO, int pointX, String winner, int draw,
      List<GameBoxEntity>? gameList, bool isOplayer, int numberOfPress)
      : super(
            pointO: pointO,
            pointX: pointX,
            winner: winner,
            draw: draw,
            gameList: gameList,
            isOplayer: isOplayer,
            numberOfPress: numberOfPress);
}

class PressedX extends GameState {
  const PressedX(int pointO, int pointX, String winner, int draw,
      List<GameBoxEntity>? gameList, bool isOplayer, int numberOfPress)
      : super(
            pointO: pointO,
            pointX: pointX,
            winner: winner,
            draw: draw,
            gameList: gameList,
            isOplayer: isOplayer,
            numberOfPress: numberOfPress);
}

class GameRestart extends GameState {
  const GameRestart(
      List<GameBoxEntity>? gameList, int pointX, int pointO, int draw)
      : super(gameList: gameList, pointO: pointO, pointX: pointX, draw: draw);
}

class GameFinished extends GameState {
  const GameFinished(
    List<GameBoxEntity>? gameList,
    int pointO,
    int pointX,
    int draw,
  ) : super(
    isGameFinished: false,
          gameList: gameList,
          pointX: pointX,
          pointO: pointO,
          draw: draw,
        );
}

class GameWinner extends GameState {
  const GameWinner(
    List<GameBoxEntity>? gameList,
    int pointO,
    int pointX,
    String winner,
    int draw,
  ) : super(isGameFinished: true,
            gameList: gameList,
            pointX: pointX,
            pointO: pointO,
            draw: draw,
            winner: winner);
}
