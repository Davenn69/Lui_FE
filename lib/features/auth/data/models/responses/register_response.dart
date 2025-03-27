import 'package:lui_fe/features/auth/data/models/user_model.dart';

class RegisterResponse {
  final bool success;
  final int statusCode;
  final String message;
  final UserModel? user;
  final List<String>? errors;

  RegisterResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    this.user,
    this.errors,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      success: json['success'], 
      statusCode: json['statusCode'], 
      message: json['message'],
      user: json['user'] != null ? UserModel.fromJson(json: json['user']) : null,
      errors: json['errors'] != null ? List<String>.from(json['errors']) : null,
    );
  }
}