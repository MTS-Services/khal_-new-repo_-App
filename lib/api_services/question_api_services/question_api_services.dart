import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zidney/api_services/api_contstants/api_urls.dart';

import '../../models/question/question_model.dart';


class QuestionApiService {


  static Future<QuestionResponse> getQuestions() async {
    final url = Uri.parse('${ApiUrls.baseUrl}/questions');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${ApiUrls.token}',
          'Content-Type': 'application/json',
        },
      );

      print("question response status: ${response.statusCode}");

      if (response.statusCode == 200) {
        return QuestionResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load questions: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  static Future<QuestionResponse> getQuestionsByTopic(int topicId) async {
    final url = Uri.parse('${ApiUrls.baseUrl}/questions?topic_id=$topicId');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${ApiUrls.token}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return QuestionResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load questions: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}