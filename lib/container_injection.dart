import 'package:get_it/get_it.dart';
import 'package:tic_toc_toe/features/home/data/repository/game_repo_impl.dart';
import 'package:tic_toc_toe/features/home/domain/repository/game_repo.dart';
import 'package:tic_toc_toe/features/home/domain/usecase/get_box_usecase.dart';
import 'package:tic_toc_toe/features/home/presentation/bloc/game/local/game_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<GameRepo>(GameRepoImpl());
  sl.registerSingleton<GetBoxUsecase>(GetBoxUsecase(sl()));
  sl.registerSingleton<GameBloc>(GameBloc(sl()));
}
