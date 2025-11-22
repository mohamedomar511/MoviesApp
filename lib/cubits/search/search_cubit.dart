import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/search/search_state.dart';
import 'package:movies_app/models/movie_api_model.dart';
import 'package:movies_app/services/movie_search_service.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final MovieSearchService _service = MovieSearchService();

  Future<void> searchMovies(String query) async {
    if (query.isEmpty) return;
    emit(SearchLoading());
    try {
      final MovieApiModel result = await _service.searchMovies(query);
      emit(SearchSuccess(searchData: result));
    } catch (e) {
      emit(SearchFailure(errorMessage: e.toString()));
    }
  }
}
