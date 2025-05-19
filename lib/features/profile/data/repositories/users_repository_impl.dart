import 'dart:io';

import 'package:autogas/features/auth/domain/entities/user.dart';
import 'package:autogas/features/profile/data/datasources/users_datasource_impl.dart';
import 'package:autogas/features/profile/domain/datasources/users_datasource.dart';
import 'package:autogas/features/profile/domain/repositories/users_repository.dart';
import 'package:autogas/features/shared/utils/resource.dart';

class UsersRepositoryImpl extends UsersRepository {
  Future<String> toke;
  final UsersDatasource datasource;
  UsersRepositoryImpl({required this.toke, UsersDatasource? datasource})
    : datasource = datasource ?? UsersDatasourceImpl(toke);
  @override
  Future<Resource<User>> update(int id, User user, {File? file}) {
    if(file == null){
      return datasource.update(id, user);
    }
    return datasource.updateImage(id, user, file);
  }

  @override
  Future<Resource<User>> updateNotificationToken(
    int id,
    String notificationToken,
  ) {
    return datasource.updateNotificationToken(id, notificationToken);
  }

  @override
  Future<Resource<User>> updateImage(int id, User user, File file) {
    return datasource.updateImage(id, user, file);
  }
}
