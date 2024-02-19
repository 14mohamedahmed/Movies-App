import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utilies/enums.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';
import 'package:movies_app/features/movies/domain/usecases/get_popular_movies_usecase.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  PopularMoviesBloc(this._getPopularMoviesUsecase)
      : super(const PopularMoviesState()) {
    on<GetPopularMoviesEvent>(_onPopularMoviesFetched);
  }
  final GetPopularMoviesUsecase _getPopularMoviesUsecase;

  _onPopularMoviesFetched(
      GetPopularMoviesEvent event, Emitter<PopularMoviesState> emit) async {
    final response = await _getPopularMoviesUsecase();
    response.fold(
      (l) => emit(state.copyWith(
        status: RequestStatus.failure,
        popularMoviesFaliureMessage: l.statusMessage,
      )),
      (movies) => emit(state.copyWith(
        status: RequestStatus.success,
        popularMovies: movies,
      )),
    );
  }
}
