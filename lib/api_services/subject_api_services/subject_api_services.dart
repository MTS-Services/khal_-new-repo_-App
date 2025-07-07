import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zidney/api_services/api_contstants/api_urls.dart';

import '../../models/subject/subject_model.dart';

class SubjectApiService {


  static Future<SubjectResponse> getSubjects() async {
    final url = Uri.parse('${ApiUrls.baseUrl}/subjects');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${ApiUrls.token}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return SubjectResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load subjects: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}