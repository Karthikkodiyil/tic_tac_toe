import 'package:flutter/material.dart';
import 'package:tic_toc_toe/core/constants/constants.dart';
import 'package:tic_toc_toe/features/home/presentation/pages/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 6335)).then((_) {
      Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const HomePage()));
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(splashAnimation)],
        ),
      ),
    );
  }
}
