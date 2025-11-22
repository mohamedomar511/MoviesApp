import 'package:movies_app/models/movie_api_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final MovieApiModel searchData;
  SearchSuccess({required this.searchData});
}

class SearchFailure extends SearchState {
  final String errorMessage;
  SearchFailure({required this.errorMessage});
}
