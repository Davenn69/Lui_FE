import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lui_fe/core/network/dio_client.dart';
import 'package:lui_fe/features/dashboard/business/repositories/dashboard_repository.dart';
import 'package:lui_fe/features/dashboard/business/usecases/get_user_usecase.dart';
import 'package:lui_fe/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:lui_fe/features/dashboard/data/repositories/dashboard_repository_impl.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

final dashboardRemoteDataSourceProvider = Provider<DashboardRemoteDataSource>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return DashboardRemoteDataSourceImpl(dioClient);
});

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  final remoteDataSource = ref.read(dashboardRemoteDataSourceProvider);
  return DashboardRepositoryImpl(remoteDataSource: remoteDataSource);
});

final getUserUsecaseProvider = Provider<GetUserUsecase>((ref) {
  final repository = ref.read(dashboardRepositoryProvider);
  return GetUserUsecase(repository);
});

