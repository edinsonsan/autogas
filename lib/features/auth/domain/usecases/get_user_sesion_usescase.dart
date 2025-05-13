import 'package:autogas/features/auth/domain/domain.dart';

class GetUserSesionUsescase {

  AuthRepository authRepository;

  GetUserSesionUsescase(this.authRepository);

  run() => authRepository.getUserSession();

}