import 'package:lui_fe/core/session/business/repositories/session_repository.dart';
import 'package:lui_fe/core/session/data/repositories/session_repository_impl.dart';

class SaveSessionUsecase{
  final SessionRepository repository;

  SaveSessionUsecase(this.repository);

  Future<void> call(String accessToken, String refreshToken, Map<dynamic, dynamic> user)async{
    await repository.saveSession(accessToken, refreshToken, user);
  }
}

class GetSessionUsecase{
  final SessionRepository repository;

  GetSessionUsecase(this.repository);

  Future<Map?> call()async{
    return await repository.getSession();
  }
}