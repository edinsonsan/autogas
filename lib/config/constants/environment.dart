import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String _apiUrl = 'API_URL no definido';

  static Future<void> initEnvironment() async {
    await dotenv.load(fileName: '.env');
    _apiUrl = dotenv.env['API_URL'] ?? 'API_URL no definido';
  }

  static String get apiUrl => _apiUrl;
}
