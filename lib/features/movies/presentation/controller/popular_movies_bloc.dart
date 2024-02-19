import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utilies/enums.dart';
import 'package:movies_app/features/configerations/domain/enitiies/image_configs.dart';
import 'package:movies_app/features/configerations/domain/usecase/get_configurations_usecase.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';
import 'package:movies_app/features/movies/domain/usecases/get_popular_movies_usecase.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  PopularMoviesBloc(
    this._getPopularMoviesUsecase,
    this._getConfigurationUsecase,
  ) : super(const PopularMoviesState()) {
    on<GetPopularMoviesEvent>(_onPopularMoviesFetched);
    on<GetConfigurationEvent>(_onGetConfiguration);
  }
  final GetPopularMoviesUsecase _getPopularMoviesUsecase;
  // For large scale of apps, We should call this function in the
  // 1-  begining of the app and store it's data in memory or cashe the response for future use
  // OR
  // 2- when first movie request sent we can call the GetConfiurationsUseCase and this can be handeled via Interceptor
  // And In 2 ways we can handele this with the backend to let me know when this API changed
  final GetConfigurationUsecase _getConfigurationUsecase;

  _onPopularMoviesFetched(
      GetPopularMoviesEvent event, Emitter<PopularMoviesState> emit) async {
    final popularMoviesResponse = await _getPopularMoviesUsecase();
    popularMoviesResponse.fold(
      (l) => emit(state.copyWith(
        popularMoviesStatus: RequestStatus.failure,
        popularMoviesFaliureMessage: l.statusMessage,
      )),
      (movies) => emit(state.copyWith(
        popularMoviesStatus: RequestStatus.success,
        popularMovies: movies,
      )),
    );
  }

  _onGetConfiguration(
      GetConfigurationEvent event, Emitter<PopularMoviesState> emit) async {
    final popularMoviesResponse = await _getConfigurationUsecase();
    popularMoviesResponse.fold(
      (l) => emit(state.copyWith(
        configsStatus: RequestStatus.failure,
        configsFaliureMessage: l.statusMessage,
      )),
      (imageConfigs) => emit(state.copyWith(
        configsStatus: RequestStatus.success,
        imageConfigs: imageConfigs,
      )),
    );
  }
}
