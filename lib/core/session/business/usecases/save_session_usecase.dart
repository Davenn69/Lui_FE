import 'package:lui_fe/core/session/business/entity/session_entity.dart';
import 'package:lui_fe/core/session/business/repositories/session_repository.dart';
import 'package:lui_fe/core/session/data/repositories/session_repository_impl.dart';

class SaveSessionUsecase{
  final SessionRepository repository;

  SaveSessionUsecase(this.repository);

<<<<<<< HEAD:lib/core/session/business/usecases/session_usecase.dart
  Future<void> call(String accessToken, String refreshToken, Map<dynamic, dynamic> user)async{
    await repository.saveSession(accessToken, refreshToken, user);
  }
}

class GetSessionUsecase{
  final SessionRepository repository;

  GetSessionUsecase(this.repository);

  Future<Map?> call()async{
    return await repository.getSession();
=======
  Future<void> execute(SessionEntity session) async {
    await repository.saveSession(session);
>>>>>>> 4c7a2ce52eb90d8d699ae11626bc66b53f0b1efe:lib/core/session/business/usecases/save_session_usecase.dart
  }
}