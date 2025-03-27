class UserModel {
  final String id;
  final String name;
  final String email;
  final String? refreshToken;
  final bool verified;
  final String? verificationToken;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.refreshToken,
    required this.verified,
    this.verificationToken,
    required this.createdAt,
    required this.updatedAt
  });

  factory UserModel.fromJson({ required Map<String, dynamic> json }) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      refreshToken: json['refreshToken'],
      verified: json['verified'],
      verificationToken: json['verificationToken'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'refreshToken': refreshToken,
      'verified': verified,
      'verificationToken': verificationToken,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    }; 
  }
}