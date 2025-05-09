import 'role.dart';

class User {
  final int id;
  final String name;
  final String lastname;
  final String email;
  final String phone;
  final dynamic image;
  final dynamic notificaionToken;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Role> roles;

  User({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.image,
    required this.notificaionToken,
    required this.createdAt,
    required this.updatedAt,
    required this.roles,
  });
}
