class CastModel {
  List cast;

  CastModel({required this.cast});

  factory CastModel.getJson({required Map<String, dynamic> json}) {
    return CastModel(cast: json["cast"]);
  }
}
