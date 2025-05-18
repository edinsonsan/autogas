import 'dart:convert';

import 'package:autogas/core/usesCases/auth/auth_usescases.dart';
import 'package:autogas/core/usesCases/users/users_usecases.dart';
import 'package:autogas/features/auth/data/data.dart';
import 'package:autogas/features/auth/domain/domain.dart';
import 'package:autogas/features/auth/domain/entities/auth_response.dart';
import 'package:autogas/features/profile/data/datasources/users_datasource_impl.dart';
import 'package:autogas/features/profile/data/repositories/users_repository_impl.dart';
import 'package:autogas/features/profile/domain/repositories/users_repository.dart';
import 'package:autogas/features/profile/domain/usecases/users/update_user_usecase.dart';
import 'package:autogas/features/shared/infrastructure/services/shared_preferences_storage_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  SharedPreferencesStorageService get sharedPref =>
      SharedPreferencesStorageService();

  @injectable
  Future<String> get token async {
    String token = '';
    final userSession = await sharedPref.read('user');
    if (userSession != null) {
      final userMap = jsonDecode(userSession); // 👈 decodifica el string
      AuthResponseModel authResponseModel = AuthResponseModel.fromJson(userMap);
      AuthResponse authResponse = authResponseModel.toEntity();
      token = authResponse.token;
    }
    return token;
  }

  @injectable
  AuthDataSourceImpl get authDatasourceImpl => AuthDataSourceImpl();

  @injectable
  UsersDatasourceImpl get usersDatasourceImpl => UsersDatasourceImpl(token);

  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImpl(datasource: authDatasourceImpl, sharedPref);

  @injectable
  UsersRepository get usersRepository =>
      UsersRepositoryImpl(datasource: usersDatasourceImpl, toke: token);

  @injectable
  AuthUsescases get authUsescases => AuthUsescases(
    login: LoginUsescase(authRepository: authRepository),
    register: RegisterUsescase(authRepository: authRepository),
    forgot: ForgotUsescase(authRepository: authRepository),
    saveUserSesion: SaveUserSesionUsescase(authRepository),
    getUserSesion: GetUserSesionUsescase(authRepository),
    logout: LogoutUsescase(authRepository),
  );

  @injectable
  UsersUsecases get usersUsecase => UsersUsecases(
    update: UpdateUserUseCase(usersRepository: usersRepository),
  );
}
