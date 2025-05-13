import 'package:autogas/features/auth/domain/domain.dart';

class AuthUsescases {
  LoginUsescase login;
  RegisterUsescase register;
  ForgotUsescase forgot;
  SaveUserSesionUsescase saveUserSesion;
  GetUserSesionUsescase getUserSesion;
  AuthUsescases({
    required this.login,
    required this.register,
    required this.forgot,
    required this.saveUserSesion,
    required this.getUserSesion,
  });
}
