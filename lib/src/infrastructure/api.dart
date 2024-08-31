import 'package:flutter_dotenv/flutter_dotenv.dart';

class API {
  static final String _baseUrl = dotenv.env['API_BASE_URL'] ?? '';
  static const String _basePath = '/api';

  static String tags() => '$_basePath/tags';
  static String user() => '$_basePath/user';

  static String createURL(String endpoint) {
    return '$_baseUrl$endpoint';
  }
}