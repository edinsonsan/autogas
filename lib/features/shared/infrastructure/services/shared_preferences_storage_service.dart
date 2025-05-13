import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'storage_service.dart';

class SharedPreferencesStorageService implements StorageService {
  Future<SharedPreferences> get _prefs async => await SharedPreferences.getInstance();

  @override
  Future<void> save<T>(String key, T value) async {
    final prefs = await _prefs;
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      final jsonString = jsonEncode(value);
      await prefs.setString(key, jsonString);
    }
  }

  @override
  Future<T?> read<T>(String key, {T Function(Map<String, dynamic>)? fromJson}) async {
    final prefs = await _prefs;
    if (!prefs.containsKey(key)) return null;

    final value = prefs.get(key);
    if (value is T) return value;

    if (value is String && fromJson != null) {
      try {
        final Map<String, dynamic> jsonMap = jsonDecode(value);
        return fromJson(jsonMap);
      } catch (_) {
        return null;
      }
    }

    return null;
  }

  @override
  Future<bool> remove(String key) async {
    final prefs = await _prefs;
    return prefs.remove(key);
  }

  @override
  Future<bool> contains(String key) async {
    final prefs = await _prefs;
    return prefs.containsKey(key);
  }
}


// Ejemplo de uso con un modelo User
// dart
// Copiar
// Editar
// class User {
//   final String id;
//   final String name;

//   User({required this.id, required this.name});

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json['id'],
//         name: json['name'],
//       );

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'name': name,
//       };
// }
// dart
// Copiar
// Editar
// final storage = SharedPreferencesStorageService();

// await storage.save('user', user.toJson()); // Guardar usuario
// final user = await storage.read<User>(
//   'user',
//   fromJson: (json) => User.fromJson(json),
// );