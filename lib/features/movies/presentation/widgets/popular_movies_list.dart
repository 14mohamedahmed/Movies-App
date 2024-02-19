import 'package:flutter/material.dart';
import 'package:movies_app/core/utilies/extensions.dart';
import 'package:movies_app/features/configerations/domain/enitiies/image_configs.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';
import 'package:movies_app/features/movies/presentation/widgets/movie_dialog.dart';
import 'package:movies_app/features/movies/presentation/widgets/movie_image.dart';

class PopularMoviesList extends StatelessWidget {
  const PopularMoviesList(this.movies, this.imageConfigs, {super.key});
  final List<Movie> movies;
  final ImageConfigs? imageConfigs;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      itemCount: movies.length,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      itemBuilder: (context, index) {
        final movie = movies[index];
        return GestureDetector(
          onTap: () {
            showGeneralDialog(
              context: context,
              barrierDismissible: false,
              pageBuilder: (context, animation, secondaryAnimation) =>
                  MovieDialog(movie, imageConfigs),
              transitionBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(
                opacity: animation,
                child: child,
              ),
              transitionDuration: const Duration(milliseconds: 700),
            );
          },
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.zero,
            shadowColor: Colors.black,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                if (imageConfigs != null)
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                    child: SizedBox(
                      height: 200,
                      child: MovieImage(
                        imageConfigs: imageConfigs,
                        movie: movie,
                      ),
                    ),
                  ),
                if (imageConfigs != null) const SizedBox(width: 10),
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
                      const SizedBox(height: 8),
                      Text(
                        movie.releaseDate.convertToHumanRead(),
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
