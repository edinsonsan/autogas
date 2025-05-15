import 'package:autogas/core/usesCases/auth/auth_usescases.dart';
import 'package:autogas/features/auth/data/data.dart';
import 'package:autogas/features/auth/domain/domain.dart';
import 'package:autogas/features/shared/infrastructure/services/shared_preferences_storage_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {

  @injectable
  SharedPreferencesStorageService get sharedPref => SharedPreferencesStorageService();

  @injectable
  AuthDataSourceImpl get authDatasourceImpl => AuthDataSourceImpl();

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl( datasource: authDatasourceImpl, sharedPref);

  @injectable
  AuthUsescases get authUsescases => AuthUsescases(
        login: LoginUsescase(authRepository: authRepository),
        register: RegisterUsescase(authRepository: authRepository),
        forgot: ForgotUsescase(authRepository: authRepository),
        saveUserSesion: SaveUserSesionUsescase(authRepository),
        getUserSesion: GetUserSesionUsescase(authRepository),
        logout: LogoutUsescase(authRepository),
      );

}
