import 'package:lui_fe/core/session/business/repositories/session_repository.dart';

class SaveSessionUsecase{
  final SessionRepository repository;

  SaveSessionUsecase(this.repository);

  Future<void> call(String accessToken, String refreshToken)async{
    await repository.saveSession(accessToken, refreshToken);
  }
}