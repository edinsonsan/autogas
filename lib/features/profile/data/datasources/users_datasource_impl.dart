import 'dart:io';

import 'package:autogas/config/config.dart';
import 'package:autogas/features/auth/data/data.dart';
import 'package:autogas/features/auth/domain/entities/user.dart';
import 'package:autogas/features/profile/domain/datasources/users_datasource.dart';
import 'package:autogas/features/shared/shared.dart';
import 'package:dio/dio.dart';

class UsersDatasourceImpl extends UsersDatasource {
  Future<String> token;

  UsersDatasourceImpl(this.token);

  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  @override
  Future<Resource<User>> update(int id, User user, File? file) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': await token
      };

      final response = await dio.patch(
        '/users/$id',
        data: {
          'name': user.name,
          'lastname': user.lastname,
          'phone': user.phone,
        },
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;

        final userResponse = UserModel.fromJson(data);
        // final userResponse = userResponseModel.toEntity();  modelo a la entidad
        print('Data Remote: ${userResponse.toJson()}');
        // print('Token: ${userResponse.token}');
        return Success(userResponse.toEntity());
      } else {
        final data = response.data;
        return ErrorData(MessageParser.parseMessage(data['message']));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400 ||
          e.response?.statusCode == 401 ||
          e.response?.statusCode == 403 ||
          e.response?.statusCode == 404 ||
          e.response?.statusCode == 409) {
        return ErrorData(e.response?.data['message'] ?? 'Datos incorrectos');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        return ErrorData('Revisar conexión a internet');
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        return ErrorData('Tiempo de espera agotado');
      } else if (e.response != null && e.response?.statusCode == 500) {
        return ErrorData('Error del servidor: ${e.response?.data['message']}');
      } else {
        return ErrorData('Dio Error inesperado: ${e.message}');
      }
    } catch (e) {
      return ErrorData('Error inesperado: ${e.toString()}');
    }
  }

  @override
  Future<Resource<User>> updateNotificationToken(
    int id,
    String notificationToken,
  ) {
    // TODO: implement updateNotificationToken
    throw UnimplementedError();
  }
}
