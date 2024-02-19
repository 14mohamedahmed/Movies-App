import 'package:flutter/material.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';

class PopularMoviesList extends StatelessWidget {
  const PopularMoviesList(this.movies, {super.key});
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return Text(movies[index].title);
      },
    );
  }
}
