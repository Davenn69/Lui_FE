class LoginResponse {
  final bool success;
  final int statusCode;
  final String message;
  final Map<String, dynamic>? data;
  final List<String>? errors;

  LoginResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    this.data,
    this.errors,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'], 
      statusCode: json['statusCode'], 
      message: json['message'],
      data: json['data'],
      errors: json['errors'] != null ? List<String>.from(json['errors']) : null,
    );
  }
}