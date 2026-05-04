import 'package:movies_app/models/cast_model.dart';

abstract class CastState {}

class CastInitial extends CastState {}

class CastLoading extends CastState {}

class CastSuccess extends CastState {
  final CastModel castModel;

  CastSuccess(this.castModel);
}

class CastFailure extends CastState {
  final String error;

  CastFailure(this.error);
}
