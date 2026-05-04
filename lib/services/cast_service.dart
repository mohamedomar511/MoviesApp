import 'package:dio/dio.dart';
import 'package:movies_app/models/cast_model.dart';

class CastService {
  static Dio dio = Dio();

  static String baseUrl = 'https://api.themoviedb.org/3/';
  static String apiKey = '45800fd4885f7b3cd197f63e6d2285b8';

  static Future<CastModel> getCast({required int movieId}) async {
    final response = await dio.get(
      '${baseUrl}movie/$movieId/credits?api_key=$apiKey',
    );

    if (response.statusCode == 200) {
      return CastModel.getJson(json: response.data);
    } else {
      throw Exception("Error in Request");
    }
  }
}
