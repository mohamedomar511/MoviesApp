import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/fav/fav_state.dart';
import 'package:movies_app/widgets/home_widgets/movie_item.dart';
import 'package:movies_app/screens/movie_details_screen.dart';
import 'package:movies_app/cubits/fav/fav_cubit.dart';
import 'package:movies_app/widgets/home_widgets/texts_style.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          final favorites = state.favorites;
          if (favorites.isEmpty) {
            return Center(child: Text("No favorites yet ❤️", style: style3()));
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              itemCount: favorites.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 160 / 200,
              ),
              itemBuilder: (context, index) {
                final movie = favorites[index];
                return MovieItem(
                  image:
                      "https://image.tmdb.org/t/p/w500${movie['poster_path']}",
                  text: movie['title'] ?? 'No Title',
                  movie: movie,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MovieDetailsScreen(
                          image:
                              "https://image.tmdb.org/t/p/w500${movie['poster_path']}",
                          title: movie['title'] ?? 'No Title',
                          overview: movie['overview'] ?? 'No Overview',
                          voteAverage: (movie['vote_average'] ?? 0).toDouble(),
                          mediaType: movie['media_type'] ?? 'Unknown',
                          popularity: (movie['popularity'] ?? 0).toDouble(),
                          movieId: movie['id'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
