import 'package:autogas/features/auth/domain/domain.dart';
// import 'package:autogas/features/auth/domain/domain.dart';

class LoginUsescase {
  AuthRepository authRepository;

  LoginUsescase({required this.authRepository});

  run(String email, String password) => authRepository.login(email, password);
}
