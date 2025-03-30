import 'package:lui_fe/core/session/business/entity/session_entity.dart';
import 'package:lui_fe/core/session/business/repositories/session_repository.dart';
import 'package:lui_fe/core/session/data/datasources/session_local_data_source.dart';
import 'package:lui_fe/core/session/data/mappers/session_mapper.dart';

class SessionRepositoryImpl implements SessionRepository{

  final SessionLocalDataSource repository;

  SessionRepositoryImpl(this.repository);

  @override
  Future<void> saveSession(SessionEntity session) async {
    await repository.saveSession(SessionMapper.toModel(session));
  }
  
  @override
  Future<SessionEntity?> getSession() async {
    await repository.getSession();
  }

}