import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lui_fe/core/network/dio_client.dart';
import 'package:lui_fe/features/auth/business/repositories/auth_repository.dart';
import 'package:lui_fe/features/auth/business/usecases/register_usecase.dart';
import 'package:lui_fe/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:lui_fe/features/auth/data/repositories/auth_repository_impl.dart';

// FORM
final isPasswordVisibleProvider = StateProvider<bool>((ref)=>true);
final isConfirmPasswordVisibleProvider = StateProvider<bool>((ref)=>true);

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return AuthRemoteDataSourceImpl(dioClient);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.read(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remoteDataSource: remoteDataSource);
});

final registerUsecaseProvider = Provider<RegisterUsecase>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return RegisterUsecase(repository);
});

