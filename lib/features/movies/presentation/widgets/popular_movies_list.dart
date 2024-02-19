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
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Card(
          color: Colors.white,
          margin: EdgeInsets.zero,
          shadowColor: Colors.black,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const SizedBox(width: 150),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 7),
                      // TODO convert date to readable date for humans
                      Text(
                        movie.releaseDate.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
