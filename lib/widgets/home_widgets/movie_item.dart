import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/fav/fav_cubit.dart';
import 'package:movies_app/cubits/fav/fav_state.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
    required this.movie,
  });

  final String image;
  final String text;
  final VoidCallback onTap;
  final Map<String, dynamic> movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 200,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Card(
              color: const Color(0xff0A1B39),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  image,
                  height: 240,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 240,
                    width: double.infinity,
                    color: Colors.grey.shade800,
                    child: const Icon(
                      Icons.broken_image,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                final isFav = context.read<FavoriteCubit>().isFavorite(movie);
                return IconButton(
                  icon: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: isFav ? Colors.red : Colors.white,
                  ),
                  onPressed: () {
                    context.read<FavoriteCubit>().toggleFavorite(movie);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
