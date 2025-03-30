import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:lui_fe/core/session/business/repositories/session_repository.dart';
import 'package:lui_fe/core/session/business/usecases/get_session_usecase.dart';
import 'package:lui_fe/core/session/business/usecases/save_session_usecase.dart';
import 'package:lui_fe/core/session/data/datasources/session_local_data_source.dart';
import 'package:lui_fe/core/session/data/models/session_model.dart';
import 'package:lui_fe/core/session/data/repositories/session_repository_impl.dart';

final hiveBoxProvider = StateProvider<Box<SessionModel>?>((ref){
  return null;
});

final sessionLocalDatasourceProvider = Provider<SessionLocalDataSource>((ref){
  final session = ref.read(hiveBoxProvider);

  return SessionLocalDataSourceImpl(session!);

});

final sessionLocalRepositoryProvider = Provider<SessionRepository>((ref){
  final datasource = ref.read(sessionLocalDatasourceProvider);

  return SessionRepositoryImpl(datasource);
});

final saveSessionUsecaseProvider = Provider<SaveSessionUsecase>((ref){
  final repository = ref.read(sessionLocalRepositoryProvider);

  return SaveSessionUsecase(repository);
});

final getSessionUsecaseProvider = Provider<GetSessionUsecase>((ref) {
  final repository = ref.read(sessionLocalRepositoryProvider);

  return GetSessionUsecase(repository);
});