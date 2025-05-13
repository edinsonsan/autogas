import 'dart:io';
import 'package:autogas/config/config.dart';
import 'package:autogas/features/auth/data/data.dart';
import 'package:autogas/features/auth/domain/domain.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:autogas/features/auth/domain/entities/auth_response.dart';
import 'package:autogas/features/shared/shared.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  Future<String> getDeviceName() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return '${androidInfo.manufacturer} ${androidInfo.model}';
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return '${iosInfo.name} ${iosInfo.model}';
    } else {
      return 'Unknown Device';
    }
  }

  @override
  Future<Resource<String>> forgotPassword(String email) async {
    try {

      Map<String, String> headers = {'Content-Type': 'application/json'};

      final response = await dio.post(
        '/auth/forgot-password',
        data: {'email': email },
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        final authResponse = AuthResponseModel.fromJson(data);//Por analizar
        print('Data Remote: ${authResponse.toJson()}');
        return Success<String>(AuthResponseModel.resetPasswordMessage(response.data));
      } else {
        final data = response.data;
        return ErrorData<String>(MessageParser.parseMessage(data['message']));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 401 || e.response?.statusCode == 403 || e.response?.statusCode == 404) {
        return ErrorData<String>(
          e.response?.data['message'] ?? 'Email no encontrado',
        );
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        return ErrorData<String>('Revisar conexión a internet');
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        return ErrorData<String>('Tiempo de espera agotado');
      } else if (e.response != null && e.response?.statusCode == 500) {
        return ErrorData<String>('Error del servidor: ${e.response?.data['message']}');
      } else {
        return ErrorData<String>('Error inesperado: ${e.message}');
      }
    } catch (e) {
      return ErrorData<String>('Error inesperado: ${e.toString()}');
    }
  }

  @override
  Future<AuthResponse?> getUserSession() {
    // TODO: implement getUserSession
    throw UnimplementedError();
  }

  @override
  Future<Resource<AuthResponse>> login(String email, String password) async {
    try {
      final deviceName = await getDeviceName();

      Map<String, String> headers = {'Content-Type': 'application/json'};

      final response = await dio.post(
        '/auth/login',
        data: {'email': email, 'password': password, 'device_name': deviceName},
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;

        final authResponse = AuthResponseModel.fromJson(data);
        // final authResponse = authResponseModel.toEntity();  modelo a la entidad
        print('Data Remote: ${authResponse.toJson()}');
        print('Token: ${authResponse.token}');
        return Success(authResponse.toEntity());
      } else {
        final data = response.data;
        return ErrorData(MessageParser.parseMessage(data['message']));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 401 || e.response?.statusCode == 403 || e.response?.statusCode == 404) {
        return ErrorData(
          e.response?.data['message'] ?? 'Credenciales incorrectas',
        );
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        return ErrorData('Revisar conexión a internet');
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        return ErrorData('Tiempo de espera agotado');
      } else if (e.response != null && e.response?.statusCode == 500) {
        return ErrorData('Error del servidor: ${e.response?.data['message']}');
      } else {
        return ErrorData('Error inesperado: ${e.message}');
      }
    } catch (e) {
      return ErrorData('Error inesperado: ${e.toString()}');
    }
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Resource<AuthResponse>> register(User user) async {
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      final response = await dio.post(
        '/auth/register',
        data: UserModel.fromEntity(user).toRegisterJson(),
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;

        final authResponse = AuthResponseModel.fromJson(data);
        // final authResponse = authResponseModel.toEntity();  modelo a la entidad
        print('Data Remote: ${authResponse.toJson()}');
        print('Token: ${authResponse.token}');
        return Success(authResponse.toEntity());
      } else {
        final data = response.data;
        return ErrorData(MessageParser.parseMessage(data['message']));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401 || e.response?.statusCode == 403 || e.response?.statusCode == 404 || e.response?.statusCode == 409) {
        return ErrorData(
          e.response?.data['message'] ?? 'Datos incorrectos',
        );
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
  Future<void> saveUserSession(AuthResponse authResponse) {
    // TODO: implement saveUserSession
    throw UnimplementedError();
  }
}

@override
Future<bool> logout() {
  // TODO: implement logout
  throw UnimplementedError();
}

@override
Future<Resource<AuthResponse>> register(User user) {
  // TODO: implement register
  throw UnimplementedError();
}

@override
Future<void> saveUserSession(AuthResponse authResponse) {
  // TODO: implement saveUserSession
  throw UnimplementedError();
}
