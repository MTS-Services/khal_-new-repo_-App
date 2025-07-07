class TopicResponse {
  final bool success;
  final String message;
  final List<TopicData> data;

  TopicResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory TopicResponse.fromJson(Map<String, dynamic> json) {
    return TopicResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List)
          .map((item) => TopicData.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class TopicData {
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
  final List<TopicTranslation> translations;
  final Course course;

  TopicData({
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
    required this.translations,
    required this.course,
  });

  factory TopicData.fromJson(Map<String, dynamic> json) {
    return TopicData(
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
      translations: (json['translations'] as List)
          .map((item) => TopicTranslation.fromJson(item as Map<String, dynamic>))
          .toList(),
      course: Course.fromJson(json['course'] as Map<String, dynamic>),
    );
  }

  String get englishName {
    return translations
        .firstWhere(
          (translation) => translation.language == 'en',
      orElse: () => TopicTranslation(topicId: 0, language: 'en', name: 'Unknown'),
    )
        .name;
  }
}

class TopicTranslation {
  final int topicId;
  final String language;
  final String name;

  TopicTranslation({
    required this.topicId,
    required this.language,
    required this.name,
  });

  factory TopicTranslation.fromJson(Map<String, dynamic> json) {
    return TopicTranslation(
      topicId: json['topic_id'] as int,
      language: json['language'] as String,
      name: json['name'] as String,
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