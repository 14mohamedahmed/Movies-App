import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/configerations/domain/enitiies/image_configs.dart';
import 'package:movies_app/features/configerations/utilies/extension.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    super.key,
    required this.imageConfigs,
    required this.movie,
  });

  final ImageConfigs? imageConfigs;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: (imageConfigs?.getBaseUrlWithBackdropSize(4) ?? "") +
          movie.posterPath,
      placeholder: (context, url) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: const Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
