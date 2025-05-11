import 'role.dart';

class User {
  final int? id;
  final String name;
  final String lastname;
  final String email;
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
    required this.email,
    required this.phone,
    this.image,
    required this.password,
    this.notificaionToken,
    this.createdAt,
    this.updatedAt,
    this.roles,
  });
}
