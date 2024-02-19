part of 'popular_movies_bloc.dart';

class PopularMoviesState extends Equatable {
  final RequestStatus status;
  final List<Movie> popularMovies;
  final String popularMoviesFaliureMessage;

  const PopularMoviesState({
    this.status = RequestStatus.initial,
    this.popularMovies = const [],
    this.popularMoviesFaliureMessage = "",
  });

  PopularMoviesState copyWith({
    RequestStatus? status,
    List<Movie>? popularMovies,
    String? popularMoviesFaliureMessage,
  }) {
    return PopularMoviesState(
      popularMovies: popularMovies ?? this.popularMovies,
      status: status ?? this.status,
      popularMoviesFaliureMessage:
          popularMoviesFaliureMessage ?? this.popularMoviesFaliureMessage,
    );
  }

  @override
  List<Object> get props =>
      [status, popularMovies, popularMoviesFaliureMessage];
}
