import 'package:lui_fe/core/session/business/entity/session_entity.dart';

abstract class SessionRepository{
<<<<<<< HEAD
  Future<void> saveSession(String accessToken, String refreshToken, Map<dynamic, dynamic> user);
  Future<Map?> getSession();
=======
  Future<void> saveSession(SessionEntity session);
  Future<SessionEntity?> getSession();
>>>>>>> 4c7a2ce52eb90d8d699ae11626bc66b53f0b1efe
}