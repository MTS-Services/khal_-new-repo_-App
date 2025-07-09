class CourseResponse {
  final bool success;
  final String message;
  final List<CourseData> data;

  CourseResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CourseResponse.fromJson(Map<String, dynamic> json) {
    return CourseResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List)
          .map((item) => CourseData.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class CourseData {
  final int id;
  final int orderIndex;
  final int subjectId;
  final int status;
  final String? createdAt;
  final String? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;
  final int topicsCount;
  final int questionsCount;
  final int quizzesCount;
  final String? createdAtFormatted;
  final String? updatedAtFormatted;
  final String createdAtHuman;
  final String? updatedAtHuman;
  final String statusLabel;
  final List<CourseTranslation> translations;
  final Subject subject;

  CourseData({
    required this.id,
    required this.orderIndex,
    required this.subjectId,
    required this.status,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    required this.topicsCount,
    required this.questionsCount,
    required this.quizzesCount,
    this.createdAtFormatted,
    this.updatedAtFormatted,
    required this.createdAtHuman,
    this.updatedAtHuman,
    required this.statusLabel,
    required this.translations,
    required this.subject,
  });

  factory CourseData.fromJson(Map<String, dynamic> json) {
    return CourseData(
      id: json['id'] as int,
      orderIndex: json['order_index'] as int,
      subjectId: json['subject_id'] as int,
      status: json['status'] as int,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      topicsCount: json['topics_count'] as int,
      questionsCount: json['questions_count'] as int,
      quizzesCount: json['quizzes_count'] as int,
      createdAtFormatted: json['created_at_formatted'] as String?,
      updatedAtFormatted: json['updated_at_formatted'] as String?,
      createdAtHuman: json['created_at_human'] as String,
      updatedAtHuman: json['updated_at_human'] as String?,
      statusLabel: json['status_label'] as String,
      translations: (json['translations'] as List)
          .map((item) => CourseTranslation.fromJson(item as Map<String, dynamic>))
          .toList(),
      subject: Subject.fromJson(json['subject'] as Map<String, dynamic>),
    );
  }

  // Helper method to get the English name
  String get englishName {
    return translations
        .firstWhere(
          (translation) => translation.language == 'en',
      orElse: () => CourseTranslation(courseId: 0, language: 'en', name: 'Unknown'),
    )
        .name;
  }

  // Get summary text
  String get summary {
    return '$topicsCount Topics • $questionsCount Questions • $quizzesCount Quizzes';
  }
}

class CourseTranslation {
  final int courseId;
  final String language;
  final String name;

  CourseTranslation({
    required this.courseId,
    required this.language,
    required this.name,
  });

  factory CourseTranslation.fromJson(Map<String, dynamic> json) {
    return CourseTranslation(
      courseId: json['course_id'] as int,
      language: json['language'] as String,
      name: json['name'] as String,
    );
  }
}

class Subject {
  final int id;
  final int orderIndex;
  final String? icon;
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
  final List<SubjectTranslation> translations;

  Subject({
    required this.id,
    required this.orderIndex,
    this.icon,
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
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'] as int,
      orderIndex: json['order_index'] as int,
      icon: json['icon'] as String?,
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
          .map((item) => SubjectTranslation.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  // Get icon URL with fallback to default
  String get iconUrl {
    return icon ?? 'assets/images/default_subject.png';
  }

  // Helper method to get the English name
  String get englishName {
    return translations
        .firstWhere(
          (translation) => translation.language == 'en',
      orElse: () => SubjectTranslation(subjectId: 0, language: 'en', name: 'Unknown'),
    )
        .name;
  }
}

class SubjectTranslation {
  final int subjectId;
  final String language;
  final String name;

  SubjectTranslation({
    required this.subjectId,
    required this.language,
    required this.name,
  });

  factory SubjectTranslation.fromJson(Map<String, dynamic> json) {
    return SubjectTranslation(
      subjectId: json['subject_id'] as int,
      language: json['language'] as String,
      name: json['name'] as String,
    );
  }
}