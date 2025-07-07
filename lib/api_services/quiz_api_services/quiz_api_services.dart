import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zidney/api_services/api_contstants/api_urls.dart';

import '../../models/quiz/quiz_model.dart';


class QuizApiService {


  static Future<QuizResponse> getQuizzes() async {
    final url = Uri.parse('${ApiUrls.baseUrl}/quizzes');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${ApiUrls.token}',
          'Content-Type': 'application/json',
        },
      );


      if (response.statusCode == 200) {
        return QuizResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load quizzes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  static Future<QuizResponse> getQuizzesByTopic(int topicId) async {
    final url = Uri.parse('${ApiUrls.baseUrl}/quizzes?topic_id=$topicId');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${ApiUrls.token}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return QuizResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load quizzes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}