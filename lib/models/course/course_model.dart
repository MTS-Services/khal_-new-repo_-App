class CourseListResponse {
  final bool success;
  final String message;
  final List<Course> data;

  CourseListResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CourseListResponse.fromJson(Map<String, dynamic> json) {
    return CourseListResponse(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List).map((e) => Course.fromJson(e)).toList(),
    );
  }
}

class Course {
  final int id;
  final int orderIndex;
  final int subjectId;
  final String name;
  final int status;
  final bool isPremium;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? createdBy;
  final int? updatedBy;
  final String statusLabel;

  Course({
    required this.id,
    required this.orderIndex,
    required this.subjectId,
    required this.name,
    required this.status,
    required this.isPremium,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    required this.statusLabel,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      orderIndex: json['order_index'],
      subjectId: json['subject_id'],
      name: json['name'],
      status: json['status'],
      isPremium: json['is_premium'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      statusLabel: json['status_label'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_index': orderIndex,
      'subject_id': subjectId,
      'name': name,
      'status': status,
      'is_premium': isPremium,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'created_by': createdBy,
      'updated_by': updatedBy,
      'status_label': statusLabel,
    };
  }
}