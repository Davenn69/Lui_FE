import 'package:lui_fe/core/session/business/entity/session_entity.dart';
import 'package:lui_fe/core/session/business/repositories/session_repository.dart';

class GetSessionUsecase {
  final SessionRepository repository;

  GetSessionUsecase(this.repository);

  Future<SessionEntity?> execute() {
    return repository.getSession();
  } 
}