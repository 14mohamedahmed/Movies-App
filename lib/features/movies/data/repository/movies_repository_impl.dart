import 'package:dartz/dartz.dart';
import 'package:movies_app/core/network/exception/server_exception.dart';
import 'package:movies_app/core/network/models/api_error_model.dart';
import 'package:movies_app/features/movies/data/datasource/movies_remote_datasource.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';
import 'package:movies_app/features/movies/domain/repository/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesRemoteDatasource _moviesRemoteDataSource;
  MovieRepositoryImpl(this._moviesRemoteDataSource);

  @override
  Future<Either<ApiFaliureModel, List<MovieModel>>> popularMovies() async {
    try {
      final result = await _moviesRemoteDataSource.getPopularMovies();
      return Right(result);
    } on ServerException catch (faliure) {
      return Left(faliure.errorModel);
    }
  }
}
