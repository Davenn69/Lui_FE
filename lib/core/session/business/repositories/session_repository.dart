import 'package:lui_fe/core/session/business/entity/session_entity.dart';

abstract class SessionRepository{
  Future<void> saveSession(SessionEntity session);
  Future<SessionEntity?> getSession();
}