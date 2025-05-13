import 'package:autogas/features/auth/domain/domain.dart';

class ForgotUsescase {
  AuthRepository authRepository;
  ForgotUsescase({required this.authRepository});

  run(String email) => authRepository.forgotPassword(email);
}
