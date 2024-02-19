import 'package:flutter/material.dart';
import 'package:movies_app/core/utilies/extensions.dart';
import 'package:movies_app/features/configerations/domain/enitiies/image_configs.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';
import 'package:movies_app/features/movies/presentation/widgets/movie_image.dart';

class MovieDialog extends StatelessWidget {
  const MovieDialog(this.movie, this.imageConfigs, {super.key});
  final Movie movie;
  final ImageConfigs? imageConfigs;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        titlePadding: const EdgeInsets.fromLTRB(24, 15, 10, 10),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        title: Row(
          children: [
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title),
                Text(
                  movie.releaseDate.convertToHumanRead(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            )),
            const CloseButton(),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(movie.overview),
            const SizedBox(height: 25),
            MovieImage(imageConfigs: imageConfigs, movie: movie),
          ],
        ),
      ),
    );
  }
}
