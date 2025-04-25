import 'package:tic_toc_toe/features/home/domain/entity/game_box_entity.dart';

abstract class GameRepo {
  List<GameBoxEntity> getGameList();
}
