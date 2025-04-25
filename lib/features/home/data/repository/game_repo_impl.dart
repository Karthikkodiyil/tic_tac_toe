import 'package:tic_toc_toe/core/constants/constants.dart';
import 'package:tic_toc_toe/features/home/domain/entity/game_box_entity.dart';
import 'package:tic_toc_toe/features/home/domain/repository/game_repo.dart';

class GameRepoImpl implements GameRepo {
  @override
  List<GameBoxEntity> getGameList() {
    List<GameBoxEntity> boxList =
        List.generate(9, (index) => GameBoxEntity(box: boxIcon));
    return boxList;
  }
}
