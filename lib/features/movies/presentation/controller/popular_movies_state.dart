part of 'popular_movies_bloc.dart';

class PopularMoviesState extends Equatable {
  final RequestStatus popularMoviesStatus, configsStatus;
  final List<Movie> popularMovies;
  final ImageConfigs? imageConfigs;
  final String popularMoviesFaliureMessage, configsFaliureMessage;

  const PopularMoviesState({
    this.popularMoviesStatus = RequestStatus.initial,
    this.configsStatus = RequestStatus.initial,
    this.popularMovies = const [],
    this.imageConfigs,
    this.popularMoviesFaliureMessage = "",
    this.configsFaliureMessage = "",
  });

  PopularMoviesState copyWith({
    RequestStatus? popularMoviesStatus,
    configsStatus,
    List<Movie>? popularMovies,
    ImageConfigs? imageConfigs,
    String? popularMoviesFaliureMessage,
    configsFaliureMessage,
  }) {
    return PopularMoviesState(
      popularMovies: popularMovies ?? this.popularMovies,
      configsFaliureMessage:
          configsFaliureMessage ?? this.configsFaliureMessage,
      configsStatus: configsStatus ?? this.configsStatus,
      imageConfigs: imageConfigs ?? this.imageConfigs,
      popularMoviesStatus: popularMoviesStatus ?? this.popularMoviesStatus,
      popularMoviesFaliureMessage:
          popularMoviesFaliureMessage ?? this.popularMoviesFaliureMessage,
    );
  }

  @override
  List<Object> get props =>
      [popularMoviesStatus, popularMovies, popularMoviesFaliureMessage];
}
