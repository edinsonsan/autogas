import 'dart:convert';

import 'package:autogas/features/auth/domain/entities/auth_response.dart';
import 'package:autogas/features/auth/data/models/user_model.dart';

class AuthResponseModel {
  final UserModel user;
  final String token;

  AuthResponseModel({
    required this.user,
    required this.token,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) => AuthResponseModel(
        user: UserModel.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };

  AuthResponse toEntity() => AuthResponse(
        user: user.toEntity(),
        token: token,
      );

  factory AuthResponseModel.fromEntity(AuthResponse authResponse) => AuthResponseModel(
        user: UserModel.fromEntity(authResponse.user),
        token: authResponse.token,
      );

  static String resetPasswordMessage(Map<String, dynamic> json) {
    return json['message']; // Solo devuelve el mensaje
  }
}

// Métodos helper si lo necesitas
AuthResponseModel authResponseFromJson(String str) => AuthResponseModel.fromJson(json.decode(str));
String authResponseToJson(AuthResponseModel data) => json.encode(data.toJson());
