import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zidney/api_services/api_urls.dart';

import '../models/course/course_model.dart';

class CourseApiService {

  static Future<CourseListResponse> fetchCourses() async {
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
      print(response.statusCode);
      throw Exception('Failed to load courses');
    }
  }


}