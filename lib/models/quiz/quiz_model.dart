class QuizResponse {
  final bool success;
  final String message;
  final List<Quiz> data;

  QuizResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory QuizResponse.fromJson(Map<String, dynamic> json) {
    return QuizResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List)
          .map((item) => Quiz.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Quiz {
  final int id;
  final int orderIndex;
  final int topicId;
  final int status;
  final String? createdAt;
  final String? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;
  final String statusLabel;
  final List<QuizTranslation> translations;

  Quiz({
    required this.id,
    required this.orderIndex,
    required this.topicId,
    required this.status,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    required this.statusLabel,
    required this.translations,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'] as int,
      orderIndex: json['order_index'] as int,
      topicId: json['topic_id'] as int,
      status: json['status'] as int,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      statusLabel: json['status_label'] as String,
      translations: (json['translations'] as List)
          .map((item) => QuizTranslation.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  String? getTitle(String language) {
    try {
      return translations
          .firstWhere((translation) => translation.language == language)
          .title;
    } catch (e) {
      return null;
    }
  }

  String? getDescription(String language) {
    try {
      return translations
          .firstWhere((translation) => translation.language == language)
          .description;
    } catch (e) {
      return null;
    }
  }
}

class QuizTranslation {
  final int quizId;
  final String language;
  final String title;
  final String description;

  QuizTranslation({
    required this.quizId,
    required this.language,
    required this.title,
    required this.description,
  });

  factory QuizTranslation.fromJson(Map<String, dynamic> json) {
    return QuizTranslation(
      quizId: json['quiz_id'] as int,
      language: json['language'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }
}