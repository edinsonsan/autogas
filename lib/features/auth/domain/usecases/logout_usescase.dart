import 'package:autogas/features/auth/domain/domain.dart';

class LogoutUsescase {
  AuthRepository authRepository;
  LogoutUsescase(this.authRepository);
  run() => authRepository.logout();
}
