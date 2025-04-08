import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:lui_fe/core/session/business/repositories/session_repository.dart';
import 'package:lui_fe/core/session/business/usecases/session_usecase.dart';
import 'package:lui_fe/core/session/data/datasources/auth_local_data_source.dart';
import 'package:lui_fe/core/session/data/repositories/session_repository_impl.dart';

final hiveBoxProvider = StateProvider<CollectionBox<Map<dynamic, dynamic>>?>((ref){
  return null;
});

final authLocalDatasourceProvider = Provider<AuthLocalDataSource>((ref){
  final collection = ref.read(hiveBoxProvider);

  return AuthLocalDataSourceImpl(sessionBox: collection);

});

final authLocalRepositoryProvider = Provider<SessionRepository>((ref){
  final datasource = ref.read(authLocalDatasourceProvider);

  return SessionRepositoryImpl(datasource);
});

final saveSessionUsecaseProvider = Provider<SaveSessionUsecase>((ref){
  final repository = ref.read(authLocalRepositoryProvider);

  return SaveSessionUsecase(repository);
});

final getSessionUsecaseProvider = Provider<GetSessionUsecase>((ref){
  final repository = ref.read(authLocalRepositoryProvider);

  return GetSessionUsecase(repository);
});

final sessionData = StateProvider<Map<dynamic, dynamic>?>((ref){
  return null;
});