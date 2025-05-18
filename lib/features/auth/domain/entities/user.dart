import 'role.dart';

class User {
  final int? id;
  final String name;
  final String lastname;
  final String? email;
  final String phone;
  final dynamic image;
  final String? password;
  final dynamic notificaionToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Role>? roles;

  User({
    this.id,
    required this.name,
    required this.lastname,
    this.email,
    required this.phone,
    this.image,
    this.password,
    this.notificaionToken,
    this.createdAt,
    this.updatedAt,
    this.roles,
  });

  User copyWith({
  int? id,
  String? name,
  String? lastname,
  String? email,
  String? phone,
  dynamic image,
  String? password,
  dynamic notificaionToken,
  DateTime? createdAt,
  DateTime? updatedAt,
  List<Role>? roles,
}) {
  return User(
    id: id ?? this.id,
    name: name ?? this.name,
    lastname: lastname ?? this.lastname,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    image: image ?? this.image,
    password: password ?? this.password,
    notificaionToken: notificaionToken ?? this.notificaionToken,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    roles: roles ?? this.roles,
  );
}


}

