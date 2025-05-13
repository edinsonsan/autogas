import 'package:autogas/features/auth/domain/domain.dart';
import 'package:autogas/features/auth/domain/entities/auth_response.dart';

class SaveUserSesionUsescase {

  AuthRepository authRepository;

  SaveUserSesionUsescase(this.authRepository);

  run(AuthResponse authResponse) => authRepository.saveUserSession(authResponse);

}