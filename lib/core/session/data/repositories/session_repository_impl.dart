import 'package:lui_fe/core/session/business/entity/session_entity.dart';
import 'package:lui_fe/core/session/business/repositories/session_repository.dart';
import 'package:lui_fe/core/session/data/datasources/session_local_data_source.dart';
import 'package:lui_fe/core/session/data/mappers/session_mapper.dart';

class SessionRepositoryImpl implements SessionRepository{

  final SessionLocalDataSource localDataSource;

  SessionRepositoryImpl(this.localDataSource);



  @override
<<<<<<< HEAD
  Future<void> saveSession(String accessToken, String refreshToken, Map<dynamic, dynamic> user) async {
    await repository.saveSession(accessToken, refreshToken, user);
  }

  @override
  Future<Map?> getSession() async{
    return await repository.getSession();
=======
  Future<void> saveSession(SessionEntity session) async {
    await localDataSource.saveSession(SessionMapper.toModel(session));
  }
  
  @override
  Future<SessionEntity?> getSession() async {
    final sessionModel = await localDataSource.getSession();
    if (sessionModel == null) return null; // No session found => NULL
    return SessionMapper.toEntity(sessionModel);
>>>>>>> 4c7a2ce52eb90d8d699ae11626bc66b53f0b1efe
  }
}