import 'package:autogas/features/auth/domain/entities/user.dart';
import 'package:autogas/features/auth/data/models/role_model.dart';

class UserModel {
  final int id;
  final String name;
  final String lastname;
  final String email;
  final String phone;
  final dynamic image;
  final dynamic notificaionToken;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<RoleModel> roles;

  UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        notificaionToken: json["notificaion_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        roles: List<RoleModel>.from(json["roles"].map((x) => RoleModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "image": image,
        "notificaion_token": notificaionToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
      };

  User toEntity() => User(
        id: id,
        name: name,
        lastname: lastname,
        email: email,
        phone: phone,
        image: image,
        notificaionToken: notificaionToken,
        createdAt: createdAt,
        updatedAt: updatedAt,
        roles: roles.map((e) => e.toEntity()).toList(),
      );

  factory UserModel.fromEntity(User user) => UserModel(
        id: user.id,
        name: user.name,
        lastname: user.lastname,
        email: user.email,
        phone: user.phone,
        image: user.image,
        notificaionToken: user.notificaionToken,
        createdAt: user.createdAt,
        updatedAt: user.updatedAt,
        roles: user.roles.map((r) => RoleModel.fromEntity(r)).toList(),
      );
}
