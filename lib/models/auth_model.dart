class AuthModel {
  final dynamic id;
  final dynamic email;

  AuthModel({required this.id, required this.email});

  factory AuthModel.fromJson(final id, final email) =>
      AuthModel(id: id, email: email);
}
