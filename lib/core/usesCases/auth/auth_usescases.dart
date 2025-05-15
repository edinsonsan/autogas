import 'package:autogas/features/auth/domain/domain.dart';
import 'package:autogas/features/auth/domain/usecases/logout_usescase.dart';

class AuthUsescases {
  LoginUsescase login;
  RegisterUsescase register;
  ForgotUsescase forgot;
  SaveUserSesionUsescase saveUserSesion;
  GetUserSesionUsescase getUserSesion;
  LogoutUsescase logout;
  AuthUsescases({
    required this.login,
    required this.register,
    required this.forgot,
    required this.saveUserSesion,
    required this.getUserSesion,
    required this.logout,
  });
}
