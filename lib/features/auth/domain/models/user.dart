import 'package:autogas/features/auth/domain/models/role.dart';

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

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        notificaionToken: json["notificaion_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
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
}