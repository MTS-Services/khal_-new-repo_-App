class UserResponse {
  final bool success;
  final String message;
  final UserData data;

  UserResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: UserData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class UserData {
  final int id;
  final int orderIndex;
  final String? username;
  final String name;
  final String phone;
  final String email;
  final String? image;
  final String? dob;
  final int? gender;
  final String? country;
  final String? city;
  final String? school;
  final bool isPremium;
  final bool isAdmin;
  final int status;
  final String statusLabel;
  final String genderLabel;
  final String createdAt;
  final String updatedAt;
  final UserClass userClass;

  UserData({
    required this.id,
    required this.orderIndex,
    this.username,
    required this.name,
    required this.phone,
    required this.email,
    this.image,
    this.dob,
    this.gender,
    this.country,
    this.city,
    this.school,
    required this.isPremium,
    required this.isAdmin,
    required this.status,
    required this.statusLabel,
    required this.genderLabel,
    required this.createdAt,
    required this.updatedAt,
    required this.userClass,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] as int,
      orderIndex: json['order_index'] as int,
      username: json['username'] as String?,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      image: json['image'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as int?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      school: json['school'] as String?,
      isPremium: json['is_premium'] as bool,
      isAdmin: json['is_admin'] as bool,
      status: json['status'] as int,
      statusLabel: json['status_label'] as String,
      genderLabel: json['gender_label'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      userClass: UserClass.fromJson(json['user_class'] as Map<String, dynamic>),
    );
  }
}

class UserClass {
  final String? createdAtFormatted;
  final String? updatedAtFormatted;
  final String createdAtHuman;
  final String? updatedAtHuman;
  final String statusLabel;

  UserClass({
    this.createdAtFormatted,
    this.updatedAtFormatted,
    required this.createdAtHuman,
    this.updatedAtHuman,
    required this.statusLabel,
  });

  factory UserClass.fromJson(Map<String, dynamic> json) {
    return UserClass(
      createdAtFormatted: json['created_at_formatted'] as String?,
      updatedAtFormatted: json['updated_at_formatted'] as String?,
      createdAtHuman: json['created_at_human'] as String,
      updatedAtHuman: json['updated_at_human'] as String?,
      statusLabel: json['status_label'] as String,
    );
  }
}