import 'package:autogas/features/auth/domain/entities/auth_response.dart';
import 'package:autogas/features/auth/domain/entities/user.dart';
import 'package:autogas/features/shared/shared.dart';

abstract class AuthDataSource {

  Future<Resource<AuthResponse>> login(String email, String password);
  Future<Resource<AuthResponse>> register(User user);
  Future<void> saveUserSession(AuthResponse authResponse);
  Future<AuthResponse?> getUserSession();
  Future<bool> logout();
  Future<Resource<String>> forgotPassword(String email);
  // Future<User> checkAuthStatus(String token);
}