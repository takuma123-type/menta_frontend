import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api.dart';
import 'errors.dart';

class UsersRepository {
  Future<void> create(Map<String, dynamic> userData) async {
    try {
      final response = await http.post(
        Uri.parse(API.createURL(API.user())),
        headers: {
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
        },
        body: jsonEncode(userData),
      );

      switch (response.statusCode) {
        case 201:
          print('User created successfully');
          break;
        case 400:
          throw BadRequestError();
        case 401:
          throw UnauthorizedError();
        case 404:
          throw NotFoundError();
        default:
          throw ApiError('Failed to create user', response.statusCode);
      }
    } catch (error) {
      print('Error occurred: $error');

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
