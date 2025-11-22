import 'package:movies_app/cubits/movie/movie_state.dart';
import 'package:movies_app/cubits/movie/top_rated_tv_cubit.dart';
import 'package:movies_app/screens/movie_details_screen.dart';
import 'package:movies_app/widgets/home_widgets/movie_item.dart';
import 'package:movies_app/widgets/home_widgets/skeletonizer.dart';
import 'package:movies_app/widgets/logic/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorieView extends StatelessWidget {
  const CategorieView({
    super.key,
    required this.mediaType,
    required this.query,
  });
  final String mediaType;
  final String query;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mediaType == 'tv' ? 'TV Shows 📺' : 'Movies 🎬'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<TopTvCubit, MovieState>(
              builder: (context, state) {
                if (state is MovieInitial) {
                  context.watch<TopTvCubit>().fetchTopRatedTv(
                    mediaType: mediaType,
                    query: query,
                  );
                }
                if (state is MovieLoading) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 16,
                          childAspectRatio: 160 / 200,
                        ),
                    itemBuilder: (context, index) {
                      var movieIndex = movies[index];
                      final title =
                          movieIndex["title"] ??
                          movieIndex["name"] ??
                          "No title";
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
      ),
    );
  }
}


/*
SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<TopTvCubit, MovieState>(
              builder: (context, state) {
                if (state is MovieInitial) {
                  context.read<TopTvCubit>().fetchTopRatedTv();
                }
                if (state is MovieLoading) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 16,
                          childAspectRatio: 160 / 200,
                        ),
                    itemBuilder: (context, index) {
                      var movieIndex = movies[index];
                      final title =
                          movieIndex["title"] ??
                          movieIndex["name"] ??
                          "No title";
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
                              context,
                              MovieDetailsScreen(
                                image:
                                    "https://image.tmdb.org/t/p/w500$posterPath",
                                title: title,
                                overview: overview,
                                voteAverage: voteAverage,
                                mediaType: mediaType,
                                popularity: popularity,
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
      ),





      SizedBox(
      height: height * 0.3 + 45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text('Top Rated 🍿', style: style()),
          ),
          const SizedBox(height: 6),
          BlocBuilder<TopRatedCubit, MovieState>(
            builder: (context, state) {
              if (state is MovieInitial) {
                context.read<TopRatedCubit>().fetchTopRatedMovies(
                  mediaType: 'movie',
                );
              }
              if (state is MovieLoading) {
                return SizedBox(
                  height: height * 0.30,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return const SkeletonizerWidget();
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 12);
                    },
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                );
              }
              if (state is MovieFailure) {
                return Center(child: Text(state.errorMessage));
              }
              if (state is MovieSuccess) {
                final movies = state.movieData.movies;
                return SizedBox(
                  height: height * 0.30,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      var movieIndex = movies[index];
                      final title =
                          movieIndex["title"] ??
                          movieIndex["name"] ??
                          "No title";
                      final posterPath = movieIndex["poster_path"];
                      final overview = movieIndex["overview"] ?? "No overview";
                      final voteAverage = (movieIndex["vote_average"] ?? 0)
                          .toDouble();
                      final mediaType =
                          movieIndex["media_type"] ?? "Unknown type";
                      final popularity = (movieIndex["popularity"] ?? 0)
                          .toDouble();
                      if (posterPath != null && posterPath.isNotEmpty) {
                        return MovieItem(
                          image: "https://image.tmdb.org/t/p/w500$posterPath",
                          text: title,
                          movie: movieIndex,
                          onTap: () {
                            goTo(
                              context,
                              MovieDetailsScreen(
                                image:
                                    "https://image.tmdb.org/t/p/w500$posterPath",
                                title: title,
                                overview: overview,
                                voteAverage: voteAverage,
                                mediaType: mediaType,
                                popularity: popularity,
                              ),
                            );
                          },
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                    itemCount: movies.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 12);
                    },
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
 
*/