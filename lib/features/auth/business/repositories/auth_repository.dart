import 'package:dartz/dartz.dart';
import 'package:lui_fe/core/errors/failure.dart';
import 'package:lui_fe/core/params/params.dart';
import 'package:lui_fe/features/auth/data/models/responses/login_response.dart';
import 'package:lui_fe/features/auth/data/models/responses/register_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegisterResponse>> register({ required RegisterParams registerParams });
  Future<Either<Failure, LoginResponse>> login({ required LoginParams loginParams });
}