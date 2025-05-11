import 'package:autogas/features/auth/domain/usecases/login_usescase.dart';
import 'package:autogas/features/auth/domain/usecases/register_usescase.dart';

class AuthUsescases {
  LoginUsescase login;
  RegisterUsescase register;
  AuthUsescases({
    required this.login,
    required this.register,
    });
}
