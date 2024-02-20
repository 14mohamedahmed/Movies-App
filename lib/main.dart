import 'package:flutter/material.dart';
import 'package:movies_app/core/services_locator/services_locator.dart';
import 'package:movies_app/features/movies/presentation/screens/popular_movies_screen.dart';

void main() {
  setupSingeltonServices();
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TMDB Movies',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // We are have only one screen, so we are using home widget insted of
      // using generate route or navigator 2 with go_router pacakage
      home: const PopularMoviesScreen(),
    );
  }
}
