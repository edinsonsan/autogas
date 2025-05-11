import 'package:autogas/features/auth/domain/domain.dart';
// import 'package:autogas/features/auth/domain/domain.dart';

class LoginUsescase {
  AuthRepository repository;

  LoginUsescase({required this.repository});

  run(String email, String password) => repository.login(email, password);
}
