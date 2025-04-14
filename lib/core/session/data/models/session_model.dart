import 'package:hive/hive.dart';

part 'session_model.g.dart';

@HiveType(typeId: 0)
class SessionModel extends HiveObject{
  @HiveField(0)
  String accessToken;

  @HiveField(1)
  String refreshToken;

  @HiveField(2)
  DateTime accessTokenExpires;

  @HiveField(3)
  DateTime refreshTokenExpires;

  SessionModel({
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpires,
    required this.refreshTokenExpires,
  });
}