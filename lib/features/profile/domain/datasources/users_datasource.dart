import 'dart:io';

import 'package:autogas/features/auth/domain/domain.dart';
import 'package:autogas/features/shared/shared.dart';

abstract class UsersDatasource {

  Future<Resource<User>> update(int id, User user, File? file);
  Future<Resource<User>> updateNotificationToken(int id, String notificationToken);

}