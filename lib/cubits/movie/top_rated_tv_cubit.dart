import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/movie/movie_state.dart';
import 'package:movies_app/services/movie_service.dart';

class TopTvCubit extends Cubit<MovieState> {
  TopTvCubit() : super(MovieInitial());

  Future<void> fetchTopRatedTv({
    required String mediaType,
    required String query,
  }) async {
    emit(MovieLoading());
    try {
      final movieData = await MovieService.getData(
        mediaType: mediaType,
        query: query,
      );
      emit(MovieSuccess(movieData: movieData));
    } catch (e) {
      emit(MovieFailure(errorMessage: e.toString()));
    }
  }
}
