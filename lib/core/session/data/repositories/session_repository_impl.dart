import 'package:lui_fe/core/session/business/repositories/session_repository.dart';
import 'package:lui_fe/core/session/data/datasources/auth_local_data_source.dart';

class SessionRepositoryImpl implements SessionRepository{

  final AuthLocalDataSource repository;

  SessionRepositoryImpl(this.repository);

  @override
  Future<void> saveSession(String accessToken, String refreshToken) async {
    await repository.saveSession(accessToken, refreshToken);
  }

}