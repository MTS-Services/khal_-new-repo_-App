import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zidney/api_services/api_contstants/api_urls.dart';
import '../../models/course/course_model.dart';

class CourseApiService {


  static Future<CourseResponse> getCourses(int id) async {
    final url = Uri.parse('${ApiUrls.baseUrl}/subject-courses/$id');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${ApiUrls.token}',
          'Content-Type': 'application/json',
        },
      );

      print("course response status: ${response.statusCode}");
      if (response.statusCode == 200) {
        return CourseResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load courses: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  static Future<CourseResponse> getCoursesBySubject(int subjectId) async {
    final url = Uri.parse('${ApiUrls.baseUrl}/courses?subject_id=$subjectId');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${ApiUrls.token}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return CourseResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load courses: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}