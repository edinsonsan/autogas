  import 'package:autogas/features/auth/domain/entities/role.dart';

  class RoleModel {
    final String id;
    final String name;
    final String image;
    final String route;
    final DateTime createdAt;
    final DateTime updatedAt;

    RoleModel({
      required this.id,
      required this.name,
      required this.image,
      required this.route,
      required this.createdAt,
      required this.updatedAt,
    });

    factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
          id: json["id"],
          name: json["name"],
          image: json["image"],
          route: json["route"],
          createdAt: DateTime.parse(json["created_at"]),
          updatedAt: DateTime.parse(json["updated_at"]),
        );

    Map<String, dynamic> toJson() => {
          "id": id,
          "name": name,
          "image": image,
          "route": route,
          "created_at": createdAt.toIso8601String(),
          "updated_at": updatedAt.toIso8601String(),
        };

    Role toEntity() => Role(
          id: id,
          name: name,
          image: image,
          route: route,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

    factory RoleModel.fromEntity(Role role) => RoleModel(
          id: role.id,
          name: role.name,
          image: role.image,
          route: role.route,
          createdAt: role.createdAt,
          updatedAt: role.updatedAt,
        );
  }
