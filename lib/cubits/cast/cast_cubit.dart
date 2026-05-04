import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/services/cast_service.dart';
import 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastCubit() : super(CastInitial());

  void getCast(int movieId) async {
    emit(CastLoading());

    try {
      final result = await CastService.getCast(movieId: movieId);
      emit(CastSuccess(result));
    } catch (e) {
      emit(CastFailure(e.toString()));
    }
  }
}
