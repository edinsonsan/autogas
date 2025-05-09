import 'package:autogas/features/auth/data/data.dart';
// import 'package:autogas/features/auth/domain/domain.dart';

class LoginUsescase {
  final repository = AuthRepositoryImpl();
  // run(String email, String password) async {
  //   return await repository.login(email, password);
  // }

  run(String email, String password) => repository.login(email, password);

}
