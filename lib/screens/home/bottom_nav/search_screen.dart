import 'package:movies_app/widgets/home_widgets/texts_style.dart';
import 'package:movies_app/screens/movie_details_screen.dart';
import 'package:movies_app/widgets/logic/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/search/search_cubit.dart';
import 'package:movies_app/cubits/search/search_state.dart';
import 'package:movies_app/widgets/home_widgets/movie_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Search ')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search for a movie',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    context.read<SearchCubit>().searchMovies(
                      searchController.text,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchInitial) {
                    return Center(
                      child: Text(
                        'Type a movie name to search',
                        style: style3(),
                      ),
                    );
                  } else if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchFailure) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (state is SearchSuccess) {
                    final movies = state.searchData.movies;
                    if (movies.isEmpty) {
                      return Center(
                        child: Text('No results found', style: style3()),
                      );
                    }
                    return GridView.builder(
                      itemCount: movies.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 160 / 200,
                          ),
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        if (movie['poster_path'] != null) {
                          return MovieItem(
                            image:
                                "https://image.tmdb.org/t/p/w500${movie['poster_path']}",
                            text: movie['title'] ?? movie['name'] ?? 'No Title',
                            movie: movie,
                            onTap: () {
                              goTo(
                                MovieDetailsScreen(
                                  image:
                                      "https://image.tmdb.org/t/p/w500${movie['poster_path']}",
                                  title:
                                      movie['title'] ??
                                      movie['name'] ??
                                      'No Title',
                                  overview: movie['overview'] ?? 'No Overview',
                                  voteAverage: (movie['vote_average'] ?? 0)
                                      .toDouble(),
                                  mediaType: movie['media_type'] ?? 'Unknown',
                                  popularity: (movie['popularity'] ?? 0)
                                      .toDouble(),
                                  movieId: movie['id'],
                                ),
                              );
                            },
                          );
                        } else {
                          return null;
                        }
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
