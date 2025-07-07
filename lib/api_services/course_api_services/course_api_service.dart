import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zidney/api_services/api_contstants/api_urls.dart';

import '../../models/course/course_model.dart';
import '../api_exception/api_exception.dart';

class CourseApiService {
  static Future<CourseListResponse> fetchCourses() async {
    try{
      final response = await http.get(
        Uri.parse('${ApiUrls.baseUrl}/courses'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${ApiUrls.token}', // Add token to headers
        },
      );
      if (response.statusCode == 200) {
        return CourseListResponse.fromJson(json.decode(response.body));
      } else {
        throw ApiException(
          message: 'Failed to load user details',
          statusCode: response.statusCode,
          responseBody: response.body,
        );
      }
    }catch(e){
      if (e is ApiException) rethrow;
      throw ApiException(message: 'Network error: ${e.toString()}');
    }
  }
}