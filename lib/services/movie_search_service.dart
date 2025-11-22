import 'package:dio/dio.dart';
import 'package:movies_app/models/movie_api_model.dart';

class MovieSearchService {
  final Dio _dio = Dio();
  final String apiKey = '45800fd4885f7b3cd197f63e6d2285b8';

  Future<MovieApiModel> searchMovies(String query) async {
    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/search/multi',
        queryParameters: {
          'api_key': apiKey,
          'query': query,
          'language': 'en-US',
        },
      );

      if (response.statusCode == 200) {
        return MovieApiModel.getJson(json: response.data);
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Search error: $e');
    }
  }
}
