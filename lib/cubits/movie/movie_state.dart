import 'package:movies_app/models/movie_api_model.dart';

abstract class MovieState {}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {}

final class MovieSuccess extends MovieState {
  final MovieApiModel movieData;
  MovieSuccess({required this.movieData});
}

final class MovieFailure extends MovieState {
  final String errorMessage;
  MovieFailure({required this.errorMessage});
}
