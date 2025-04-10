import 'package:lui_fe/core/session/business/entity/session_entity.dart';
import 'package:lui_fe/core/session/business/repositories/session_repository.dart';
import 'package:lui_fe/core/session/data/datasources/session_local_data_source.dart';
import 'package:lui_fe/core/session/data/mappers/session_mapper.dart';

class SessionRepositoryImpl implements SessionRepository{

  final SessionLocalDataSource localDataSource;

  SessionRepositoryImpl(this.localDataSource);



  @override
  Future<void> saveSession(SessionEntity session) async {
    await localDataSource.saveSession(SessionMapper.toModel(session));
  }
  
  @override
  Future<SessionEntity?> getSession() async {
    final sessionModel = await localDataSource.getSession();
    if (sessionModel == null) return null; // No session found => NULL
    return SessionMapper.toEntity(sessionModel);
  }
}