import 'package:autogas/features/auth/data/data.dart';
import 'package:autogas/features/auth/domain/domain.dart';
import 'package:autogas/features/auth/domain/entities/auth_response.dart';
import 'package:autogas/features/shared/utils/resource.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource datasource;

  AuthRepositoryImpl({AuthDataSource? datasource})
    : datasource = datasource ?? AuthDataSourceImpl();

  @override
  Future<String> forgotPassword(String email) {
    return datasource.forgotPassword(email);
  }

  @override
  Future<AuthResponse?> getUserSession() {
    return datasource.getUserSession();
  }

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return datasource.login(email, password);
  }

  @override
  Future<bool> logout() {
    return datasource.logout();
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    return datasource.register(user);
  }

  @override
  Future<void> saveUserSession(AuthResponse authResponse) {
    return datasource.saveUserSession(authResponse);
  }
}
