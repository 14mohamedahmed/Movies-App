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
      title: 'Movies App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PopularMoviesScreen(),
    );
  }
}
