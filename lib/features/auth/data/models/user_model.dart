import 'package:autogas/features/auth/domain/entities/user.dart';
import 'package:autogas/features/auth/data/models/role_model.dart';

class UserModel {
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
  final List<RoleModel>? roles;

  UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    password: json["password"],
    notificaionToken: json["notificaion_token"],
    roles: List<RoleModel>.from(
      json["roles"].map((x) => RoleModel.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "image": image,
    "notificaion_token": notificaionToken,
    "roles":
        roles != null ? List<dynamic>.from(roles!.map((x) => x.toJson())) : [],
  };

  User toEntity() => User(
    id: id,
    name: name,
    lastname: lastname,
    email: email,
    phone: phone,
    image: image,
    password: password,
    notificaionToken: notificaionToken,
    createdAt: createdAt,
    updatedAt: updatedAt,
    roles: roles?.map((e) => e.toEntity()).toList() ?? [],
  );

  factory UserModel.fromEntity(User user) => UserModel(
    id: user.id,
    name: user.name,
    lastname: user.lastname,
    email: user.email,
    phone: user.phone,
    image: user.image,
    password: user.password,
    notificaionToken: user.notificaionToken,
    createdAt: user.createdAt,
    updatedAt: user.updatedAt,
    roles: user.roles?.map((r) => RoleModel.fromEntity(r)).toList() ?? [],
  );

  Map<String, dynamic> toRegisterJson() => {
    "name": name,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "password": password,
    // "image": image, // Inclúyelo solo si es requerido
    // "notificaion_token": notificaionToken, // opcional
  };
}
