import 'package:dartz/dartz.dart';
import 'package:movies_app/core/network/models/api_error_model.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<Either<ApiFaliureModel, List<Movie>>> popularMovies();
}
