class MovieApiModel {
  List movies;
  MovieApiModel({required this.movies});
  factory MovieApiModel.getJson({required Map<String, dynamic> json}) {
    return MovieApiModel(movies: json["results"]);
  }
}
