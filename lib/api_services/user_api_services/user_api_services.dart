import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/user/user_model.dart';
import '../api_exception/api_exception.dart';
import '../api_contstants/api_urls.dart';

class UserApiService {


  static Future<UserResponse> getUserDetails() async {
    final url = Uri.parse('${ApiUrls.baseUrl}/user');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${ApiUrls.token}',
          'Content-Type': 'application/json',
        },
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return UserResponse.fromJson(jsonResponse);
      } else {
        throw ApiException(
          message: 'Failed to load user details',
          statusCode: response.statusCode,
          responseBody: response.body,
        );
      }
    } catch (e) {
      if (e is ApiException) rethrow;
      throw ApiException(message: 'Network error: ${e.toString()}');
    }
  }
}
