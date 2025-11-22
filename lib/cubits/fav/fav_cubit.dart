import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/fav/fav_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteState());

  void toggleFavorite(Map<String, dynamic> movie) {
    final currentFavorites = List<Map<String, dynamic>>.from(state.favorites);
    final exists = currentFavorites.any((m) => m['id'] == movie['id']);

    if (exists) {
      currentFavorites.removeWhere((m) => m['id'] == movie['id']);
    } else {
      currentFavorites.add(movie);
    }

    emit(state.copyWith(favorites: List.unmodifiable(currentFavorites)));
  }

  bool isFavorite(Map<String, dynamic> movie) {
    return state.favorites.any((m) => m['id'] == movie['id']);
  }
}
