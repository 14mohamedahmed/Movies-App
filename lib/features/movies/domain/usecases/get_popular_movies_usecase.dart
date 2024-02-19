import 'package:dartz/dartz.dart';
import 'package:movies_app/core/network/models/api_error_model.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';
import 'package:movies_app/features/movies/domain/repository/movies_repository.dart';

class GetPopularMoviesUsecase {
  final MoviesRepository _moviesRepository;
  GetPopularMoviesUsecase(this._moviesRepository);

  Future<Either<ApiFaliureModel, List<Movie>>> call() async {
    return await _moviesRepository.popularMovies();
  }
}
