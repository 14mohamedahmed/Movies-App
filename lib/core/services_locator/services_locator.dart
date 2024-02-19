import 'package:get_it/get_it.dart';
import 'package:movies_app/core/network/network_provider/api_services.dart';
import 'package:movies_app/core/network/network_provider/dio_api_service_impl.dart';
import 'package:movies_app/features/movies/data/datasource/movies_remote_datasource.dart';
import 'package:movies_app/features/movies/data/repository/movies_repository_impl.dart';
import 'package:movies_app/features/movies/domain/repository/movies_repository.dart';
import 'package:movies_app/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/features/movies/presentation/controller/popular_movies_bloc.dart';

GetIt getIt = GetIt.instance;

void setupSingeltonServices() {
  // Inject Network Handler
  getIt.registerLazySingleton<ApiService>(() => DioApiServiceImpl());

  // Inject bloc
  getIt.registerFactory(() => PopularMoviesBloc(getIt()));

  // Inject Datasouce
  getIt.registerLazySingleton<MoviesRemoteDatasource>(
      () => MoviesRemoteDatasourceImpl(getIt()));

  // Inject Repository
  getIt.registerLazySingleton<MoviesRepository>(
      () => MoviesRepositoryImpl(getIt()));

  // Inject Usecases
  getIt.registerLazySingleton(() => GetPopularMoviesUsecase(getIt()));
}
