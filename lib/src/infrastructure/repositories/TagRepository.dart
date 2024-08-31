import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api.dart';
import 'errors.dart';

class TagsRepository {
  Future<List<Map<String, dynamic>>> fetch() async {
    try {
      print('Fetching tags from: ${API.createURL(API.tags())}'); // デバッグ用ログ

      final response = await http.get(
        Uri.parse(API.createURL(API.tags())),
        headers: {
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
        },
      );

      print('Response status: ${response.statusCode}'); // デバッグ用ログ
      print('Response body: ${response.body}'); // デバッグ用ログ
      print(API.createURL(API.tags())); // これで正しいURLが出力されるか確認


      switch (response.statusCode) {
        case 200:
          final List<dynamic> data = jsonDecode(response.body);
          print('Parsed data: $data'); // デバッグ用ログ
          return data.cast<Map<String, dynamic>>();
        case 400:
          throw BadRequestError();
        case 401:
          throw UnauthorizedError();
        case 404:
          throw NotFoundError();
        default:
          throw ApiError('Failed to fetch tags', response.statusCode);
      }
    } catch (error) {
      print('Error occurred: $error'); // デバッグ用ログ

      if (error is http.ClientException) {
        throw NetworkError('Network error occurred');
      } else if (error is FormatException) {
        throw ParsingError('Failed to parse response');
      } else {
        throw UnknownError();
      }
    }
  }
}