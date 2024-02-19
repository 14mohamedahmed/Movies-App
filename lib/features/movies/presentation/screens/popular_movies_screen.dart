import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services_locator/services_locator.dart';
import 'package:movies_app/core/utilies/enums.dart';
import 'package:movies_app/features/movies/presentation/controller/popular_movies_bloc.dart';
import 'package:movies_app/features/movies/presentation/widgets/popular_movies_list.dart';

class PopularMoviesScreen extends StatelessWidget {
  const PopularMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<PopularMoviesBloc>()..add(GetPopularMoviesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Movies"),
          centerTitle: true,
          elevation: 1,
        ),
        body: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
            builder: (context, state) {
          return switch (state.status) {
            RequestStatus.initial =>
              const Center(child: CircularProgressIndicator.adaptive()),
            RequestStatus.success => PopularMoviesList(state.popularMovies),
            RequestStatus.failure => Center(
                child: Text(state.popularMoviesFaliureMessage),
              ),
          };
        }),
      ),
    );
  }
}
