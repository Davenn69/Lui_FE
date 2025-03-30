import 'package:lui_fe/core/session/business/entity/session_entity.dart';
import 'package:lui_fe/core/session/business/repositories/session_repository.dart';

class SaveSessionUsecase{
  final SessionRepository repository;

  SaveSessionUsecase(this.repository);

  Future<void> execute(SessionEntity session) async {
    await repository.saveSession(session);
  }
}