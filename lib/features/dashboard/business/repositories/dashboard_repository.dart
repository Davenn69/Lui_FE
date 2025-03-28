import 'package:dartz/dartz.dart';
import 'package:lui_fe/core/errors/failure.dart';
import 'package:lui_fe/features/dashboard/data/models/get_user_response.dart';

abstract class DashboardRepository {
  Future<Either<Failure, GetUserResponse>> getUser({ required String userId });
}