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

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class UserData {
  final int id;
  final int orderIndex;
  final String? username;
  final String name;
  final String phone;
  final String email;
  final int? userClassId;
  final String? image;
  final String? dob;
  final String? gender;
  final String? country;
  final String? city;
  final String? school;
  final bool isPremium;
  final String? premiumExpiresAt;
  final String emailVerifiedAt;
  final String? otp;
  final String? otpSentAt;
  final String? otpExpiresAt;
  final bool isAdmin;
  final int status;
  final String createdAt;
  final String? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;
  final String createdAtFormatted;
  final String? updatedAtFormatted;
  final String createdAtHuman;
  final String? updatedAtHuman;
  final String statusLabel;
  final Map<String, String> statusList;
  final String genderLabel;
  final UserClass userClass;

  UserData({
    required this.id,
    required this.orderIndex,
    this.username,
    required this.name,
    required this.phone,
    required this.email,
    this.userClassId,
    this.image,
    this.dob,
    this.gender,
    this.country,
    this.city,
    this.school,
    required this.isPremium,
    this.premiumExpiresAt,
    required this.emailVerifiedAt,
    this.otp,
    this.otpSentAt,
    this.otpExpiresAt,
    required this.isAdmin,
    required this.status,
    required this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    required this.createdAtFormatted,
    this.updatedAtFormatted,
    required this.createdAtHuman,
    this.updatedAtHuman,
    required this.statusLabel,
    required this.statusList,
    required this.genderLabel,
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
      userClassId: json['user_class_id'] as int?,
      image: json['image'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      school: json['school'] as String?,
      isPremium: json['is_premium'] as bool,
      premiumExpiresAt: json['premium_expires_at'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String,
      otp: json['otp'] as String?,
      otpSentAt: json['otp_sent_at'] as String?,
      otpExpiresAt: json['otp_expires_at'] as String?,
      isAdmin: json['is_admin'] as bool,
      status: json['status'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String?,
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAtFormatted: json['created_at_formatted'] as String,
      updatedAtFormatted: json['updated_at_formatted'] as String?,
      createdAtHuman: json['created_at_human'] as String,
      updatedAtHuman: json['updated_at_human'] as String?,
      statusLabel: json['status_label'] as String,
      statusList: Map<String, String>.from(json['status_list'] as Map),
      genderLabel: json['gender_label'] as String,
      userClass: UserClass.fromJson(json['user_class'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_index': orderIndex,
      'username': username,
      'name': name,
      'phone': phone,
      'email': email,
      'user_class_id': userClassId,
      'image': image,
      'dob': dob,
      'gender': gender,
      'country': country,
      'city': city,
      'school': school,
      'is_premium': isPremium,
      'premium_expires_at': premiumExpiresAt,
      'email_verified_at': emailVerifiedAt,
      'otp': otp,
      'otp_sent_at': otpSentAt,
      'otp_expires_at': otpExpiresAt,
      'is_admin': isAdmin,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'created_by': createdBy,
      'updated_by': updatedBy,
      'created_at_formatted': createdAtFormatted,
      'updated_at_formatted': updatedAtFormatted,
      'created_at_human': createdAtHuman,
      'updated_at_human': updatedAtHuman,
      'status_label': statusLabel,
      'status_list': statusList,
      'gender_label': genderLabel,
      'user_class': userClass.toJson(),
    };
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

  Map<String, dynamic> toJson() {
    return {
      'created_at_formatted': createdAtFormatted,
      'updated_at_formatted': updatedAtFormatted,
      'created_at_human': createdAtHuman,
      'updated_at_human': updatedAtHuman,
      'status_label': statusLabel,
    };
  }
}