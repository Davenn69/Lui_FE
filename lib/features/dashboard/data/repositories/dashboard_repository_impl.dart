import 'package:dartz/dartz.dart';
import 'package:lui_fe/core/errors/failure.dart';
import 'package:lui_fe/features/dashboard/business/repositories/dashboard_repository.dart';
import 'package:lui_fe/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:lui_fe/features/dashboard/data/models/get_user_response.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;
  // final DashboardLocalDataSource localDataSource;

  DashboardRepositoryImpl({ required this.remoteDataSource });

  @override
  Future<Either<Failure, GetUserResponse>> getUser({required String userId}) async {
    try {
      print("📤 Sending data: ${userId} ");
      final response = await remoteDataSource.getUser(userId: userId);
      print('Response for get user: $response');
      return Right(response);
    } catch (e) {
      if (e is ServerFailure) {
        return Left(ServerFailure(statusCode: e.statusCode, errorData: e.errorData, errorMessage: e.errorMessage));
      }
      return Left(ServerFailure(statusCode: 500, errorData: null, errorMessage: "Unknown error occured"));
    }
  }
  
}