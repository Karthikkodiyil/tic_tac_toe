import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_toc_toe/container_injection.dart';
import 'package:tic_toc_toe/features/home/presentation/bloc/game/local/game_bloc.dart';
import 'package:tic_toc_toe/features/home/presentation/bloc/game/local/game_event.dart';
import 'package:tic_toc_toe/features/splash_screen/presentation/pages/splash_page.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameBloc>(
      create: (context) => sl()..add(GameBoxEvent()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
