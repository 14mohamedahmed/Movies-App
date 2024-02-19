import 'package:movies_app/core/network/api_constants.dart';
import 'package:movies_app/core/network/exception/server_exception.dart';
import 'package:movies_app/core/network/network_provider/api_services.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';

abstract class MoviesRemoteDatasource {
  Future<List<MovieModel>> getPopularMovies();
}

class MoviesRemoteDatasourceImpl extends MoviesRemoteDatasource {
  final ApiService _apiService;
  MoviesRemoteDatasourceImpl(this._apiService);

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await _apiService.get(ApiConstants.popularMovies);
    return response.fold(
      (l) {
        throw ServerException(errorModel: l);
      },
      (r) {
        return List<MovieModel>.from(
          (r.data['results'] as List).map(
            (movie) => MovieModel.fromJson(movie),
          ),
        );
      },
    );
  }
}
