import 'package:dio/dio.dart';
import 'package:movies_app/models/movie_api_model.dart';

class MovieService {
  static Dio dio = Dio();
  static String baseUrl = 'https://api.themoviedb.org/3/';
  static String apiKey = '45800fd4885f7b3cd197f63e6d2285b8';

  static Future<MovieApiModel> getData({
    String? prefix,
    required String mediaType,
    required String query,
  }) async {
    final String url = prefix != null && prefix.isNotEmpty
        ? '$baseUrl$prefix/$mediaType/$query?api_key=$apiKey'
        : '$baseUrl$mediaType/$query?api_key=$apiKey';

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      return MovieApiModel.getJson(json: response.data);
    } else {
      throw Exception("Error in Request");
    }
  }
}
