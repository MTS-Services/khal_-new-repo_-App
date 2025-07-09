import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zidney/api_services/api_contstants/api_urls.dart';

import '../../models/topic/topic_model.dart';


class TopicApiService {


  static Future<TopicResponse> getTopics(int id) async {
    final url = Uri.parse('${ApiUrls.baseUrl}/course-topics/$id');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${ApiUrls.token}',
          'Content-Type': 'application/json',
        },
      );

      print("topic response status: ${response.statusCode}");

      if (response.statusCode == 200) {
        return TopicResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load topics: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  static Future<TopicResponse> getTopicsByCourse(int courseId) async {
    final url = Uri.parse('${ApiUrls.baseUrl}/topics?course_id=$courseId');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${ApiUrls.baseUrl}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return TopicResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load topics: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}