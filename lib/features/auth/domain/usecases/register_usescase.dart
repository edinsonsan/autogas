import 'package:autogas/features/auth/domain/domain.dart';
// import 'package:autogas/features/auth/domain/domain.dart';

class RegisterUsescase {
  AuthRepository authRepository;

  RegisterUsescase({required this.authRepository});

  run(User user) => authRepository.register(user);
}
