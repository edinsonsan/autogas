import 'dart:io';

import 'package:autogas/features/auth/domain/domain.dart';
import 'package:autogas/features/profile/domain/repositories/users_repository.dart';

class UpdateUserUseCase {

  UsersRepository usersRepository;

  UpdateUserUseCase({required this.usersRepository});

  run(int id, User user, File? file) => usersRepository.update(id, user, file);

}