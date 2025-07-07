class QuestionResponse {
  final bool success;
  final String message;
  final List<Question> data;

  QuestionResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory QuestionResponse.fromJson(Map<String, dynamic> json) {
    return QuestionResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List)
          .map((item) => Question.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Question {
  final int id;
  final int orderIndex;
  final int questionDetailsId;
  final int status;
  final String? createdAt;
  final String? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;
  final String? createdAtFormatted;
  final String? updatedAtFormatted;
  final String createdAtHuman;
  final String? updatedAtHuman;
  final String statusLabel;
  final List<QuestionTranslation> translations;
  final QuestionDetails questionDetails;

  Question({
    required this.id,
    required this.orderIndex,
    required this.questionDetailsId,
    required this.status,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.createdAtFormatted,
    this.updatedAtFormatted,
    required this.createdAtHuman,
    this.updatedAtHuman,
    required this.statusLabel,
    required this.translations,
    required this.questionDetails,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as int,
      orderIndex: json['order_index'] as int,
      questionDetailsId: json['question_details_id'] as int,
      status: json['status'] as int,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAtFormatted: json['created_at_formatted'] as String?,
      updatedAtFormatted: json['updated_at_formatted'] as String?,
      createdAtHuman: json['created_at_human'] as String,
      updatedAtHuman: json['updated_at_human'] as String?,
      statusLabel: json['status_label'] as String,
      translations: (json['translations'] as List)
          .map((item) => QuestionTranslation.fromJson(item as Map<String, dynamic>))
          .toList(),
      questionDetails: QuestionDetails.fromJson(json['question_details'] as Map<String, dynamic>),
    );
  }

  String? getTranslation(String language) {
    try {
      return translations
          .firstWhere((translation) => translation.language == language)
          .title;
    } catch (e) {
      return null;
    }
  }

  String? getAnswer(String language) {
    try {
      return translations
          .firstWhere((translation) => translation.language == language)
          .answer;
    } catch (e) {
      return null;
    }
  }
}

class QuestionTranslation {
  final int questionId;
  final String language;
  final String title;
  final String answer;

  QuestionTranslation({
    required this.questionId,
    required this.language,
    required this.title,
    required this.answer,
  });

  factory QuestionTranslation.fromJson(Map<String, dynamic> json) {
    return QuestionTranslation(
      questionId: json['question_id'] as int,
      language: json['language'] as String,
      title: json['title'] as String,
      answer: json['answer'] as String,
    );
  }
}

class QuestionDetails {
  final int id;
  final int orderIndex;
  final int topicId;
  final String? file;
  final int status;
  final String? createdAt;
  final String? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;
  final String? createdAtFormatted;
  final String? updatedAtFormatted;
  final String createdAtHuman;
  final String? updatedAtHuman;
  final Topic topic;

  QuestionDetails({
    required this.id,
    required this.orderIndex,
    required this.topicId,
    this.file,
    required this.status,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.createdAtFormatted,
    this.updatedAtFormatted,
    required this.createdAtHuman,
    this.updatedAtHuman,
    required this.topic,
  });

  factory QuestionDetails.fromJson(Map<String, dynamic> json) {
    return QuestionDetails(
      id: json['id'] as int,
      orderIndex: json['order_index'] as int,
      topicId: json['topic_id'] as int,
      file: json['file'] as String?,
      status: json['status'] as int,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAtFormatted: json['created_at_formatted'] as String?,
      updatedAtFormatted: json['updated_at_formatted'] as String?,
      createdAtHuman: json['created_at_human'] as String,
      updatedAtHuman: json['updated_at_human'] as String?,
      topic: Topic.fromJson(json['topic'] as Map<String, dynamic>),
    );
  }
}

class Topic {
  final int id;
  final int orderIndex;
  final int courseId;
  final int status;
  final String? createdAt;
  final String? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;
  final String? createdAtFormatted;
  final String? updatedAtFormatted;
  final String createdAtHuman;
  final String? updatedAtHuman;
  final String statusLabel;
  final Course course;

  Topic({
    required this.id,
    required this.orderIndex,
    required this.courseId,
    required this.status,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.createdAtFormatted,
    this.updatedAtFormatted,
    required this.createdAtHuman,
    this.updatedAtHuman,
    required this.statusLabel,
    required this.course,
  });

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      id: json['id'] as int,
      orderIndex: json['order_index'] as int,
      courseId: json['course_id'] as int,
      status: json['status'] as int,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAtFormatted: json['created_at_formatted'] as String?,
      updatedAtFormatted: json['updated_at_formatted'] as String?,
      createdAtHuman: json['created_at_human'] as String,
      updatedAtHuman: json['updated_at_human'] as String?,
      statusLabel: json['status_label'] as String,
      course: Course.fromJson(json['course'] as Map<String, dynamic>),
    );
  }
}

class Course {
  final int id;
  final int orderIndex;
  final int subjectId;
  final int status;
  final String? createdAt;
  final String? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;
  final String? createdAtFormatted;
  final String? updatedAtFormatted;
  final String createdAtHuman;
  final String? updatedAtHuman;
  final String statusLabel;
  final Subject subject;

  Course({
    required this.id,
    required this.orderIndex,
    required this.subjectId,
    required this.status,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.createdAtFormatted,
    this.updatedAtFormatted,
    required this.createdAtHuman,
    this.updatedAtHuman,
    required this.statusLabel,
    required this.subject,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as int,
      orderIndex: json['order_index'] as int,
      subjectId: json['subject_id'] as int,
      status: json['status'] as int,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAtFormatted: json['created_at_formatted'] as String?,
      updatedAtFormatted: json['updated_at_formatted'] as String?,
      createdAtHuman: json['created_at_human'] as String,
      updatedAtHuman: json['updated_at_human'] as String?,
      statusLabel: json['status_label'] as String,
      subject: Subject.fromJson(json['subject'] as Map<String, dynamic>),
    );
  }
}

class Subject {
  final int id;
  final int orderIndex;
  final String? icon;
  final int status;
  final bool isPremium;
  final String? createdAt;
  final String? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;
  final String? createdAtFormatted;
  final String? updatedAtFormatted;
  final String createdAtHuman;
  final String? updatedAtHuman;
  final String statusLabel;

  Subject({
    required this.id,
    required this.orderIndex,
    this.icon,
    required this.status,
    required this.isPremium,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.createdAtFormatted,
    this.updatedAtFormatted,
    required this.createdAtHuman,
    this.updatedAtHuman,
    required this.statusLabel,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'] as int,
      orderIndex: json['order_index'] as int,
      icon: json['icon'] as String?,
      status: json['status'] as int,
      isPremium: json['is_premium'] as bool,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAtFormatted: json['created_at_formatted'] as String?,
      updatedAtFormatted: json['updated_at_formatted'] as String?,
      createdAtHuman: json['created_at_human'] as String,
      updatedAtHuman: json['updated_at_human'] as String?,
      statusLabel: json['status_label'] as String,
    );
  }
}