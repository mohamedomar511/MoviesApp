import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/movie/movie_cubit.dart';
import 'package:movies_app/cubits/movie/movie_state.dart';
import 'package:movies_app/screens/movie_details_screen.dart';
import 'package:movies_app/widgets/home_widgets/movie_item.dart';
import 'package:movies_app/widgets/home_widgets/skeletonizer.dart';
import 'package:movies_app/widgets/home_widgets/texts_style.dart';
import 'package:movies_app/widgets/logic/navigator.dart';

class TrendScreen extends StatelessWidget {
  const TrendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Trending 🚀', style: style()),
          const SizedBox(height: 10),
          BlocBuilder<MovieCubit, MovieState>(
            builder: (context, state) {
              if (state is MovieInitial) {
                context.read<MovieCubit>().fetchMovies(
                  mediaType: 'all',
                  query: 'day',
                  prefix: 'trending',
                );
              }
              if (state is MovieLoading) {
                return GridView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 16,
                    childAspectRatio: 160 / 200,
                  ),
                  itemBuilder: (context, index) {
                    return const SkeletonizerWidget();
                  },
                );
              }
              if (state is MovieFailure) {
                return Center(child: Text(state.errorMessage));
              }
              if (state is MovieSuccess) {
                final movies = state.movieData.movies;
                return GridView.builder(
                  itemCount: movies.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 160 / 200,
                  ),
                  itemBuilder: (context, index) {
                    var movieIndex = movies[index];
                    final title =
                        movieIndex["title"] ?? movieIndex["name"] ?? "No title";
                    final posterPath = movieIndex["poster_path"];
                    final overview = movieIndex["overview"] ?? "No overview";
                    final voteAverage = (movieIndex["vote_average"] ?? 0)
                        .toDouble();
                    final mediaType =
                        movieIndex["media_type"] ?? "Unknown type";
                    final popularity = (movieIndex["popularity"] ?? 0)
                        .toDouble();

                    if (posterPath != null) {
                      return MovieItem(
                        image: "https://image.tmdb.org/t/p/w500$posterPath",
                        text: title,
                        movie: movieIndex,
                        onTap: () {
                          goTo(
                            MovieDetailsScreen(
                              image:
                                  "https://image.tmdb.org/t/p/w500$posterPath",
                              title: title,
                              overview: overview,
                              voteAverage: voteAverage,
                              mediaType: mediaType,
                              popularity: popularity,
                              movieId: movieIndex['id'],
                            ),
                          );
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
