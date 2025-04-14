import 'package:dartz/dartz.dart';
import 'package:lui_fe/core/errors/failure.dart';
import 'package:lui_fe/features/dashboard/business/repositories/dashboard_repository.dart';
import 'package:lui_fe/features/dashboard/data/models/get_user_response.dart';

class GetUserUsecase {
  final DashboardRepository repository;

  GetUserUsecase(this.repository);

  Future<Either<Failure, GetUserResponse>> call(String userId) async {
    return await repository.getUser(userId: userId);
  }
}