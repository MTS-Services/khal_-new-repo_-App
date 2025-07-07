import '../../utils/asset_path.dart';

class SubjectResponse {
  final bool success;
  final String message;
  final List<SubjectData> data;

  SubjectResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SubjectResponse.fromJson(Map<String, dynamic> json) {
    return SubjectResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List)
          .map((item) => SubjectData.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SubjectData {
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
  final List<SubjectTranslation> translations;

  SubjectData({
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
    required this.translations,
  });

  factory SubjectData.fromJson(Map<String, dynamic> json) {
    return SubjectData(
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
      translations: (json['translations'] as List)
          .map((item) => SubjectTranslation.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  // Helper method to get the English name
  String get englishName {
    return translations
        .firstWhere((translation) => translation.language == 'en',
        orElse: () => SubjectTranslation(subjectId: 0, language: 'en', name: 'Unknown'))
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