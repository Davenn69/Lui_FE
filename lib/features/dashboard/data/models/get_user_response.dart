import 'package:lui_fe/features/auth/data/models/user_model.dart';

class GetUserResponse {
  final bool success;
  final int statusCode;
  final String message;
  final UserModel? data;
  final List<String>? errors;

  GetUserResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    this.data,
    this.errors,
  });

  factory GetUserResponse.fromJson(Map<String, dynamic> json) {
    return GetUserResponse(
      success: json['success'], 
      statusCode: json['statusCode'], 
      message: json['message'],
      data: json['data'] != null ? UserModel.fromJson(json: json['data']) : null,
      errors: json['errors'] != null ? List<String>.from(json['errors']) : null,
    );
  }
}