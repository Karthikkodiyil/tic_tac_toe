import 'package:tic_toc_toe/core/usecase/usecase.dart';
import 'package:tic_toc_toe/features/home/domain/entity/game_box_entity.dart';
import 'package:tic_toc_toe/features/home/domain/repository/game_repo.dart';


class GetBoxUsecase implements Usecase<List<GameBoxEntity>,void> {
  final GameRepo _gameRepo;

  GetBoxUsecase(this._gameRepo);
  @override
  List<GameBoxEntity> call({params}) {
    return _gameRepo.getGameList();
  }
}
