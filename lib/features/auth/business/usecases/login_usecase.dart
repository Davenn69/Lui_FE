import 'package:dartz/dartz.dart';
import 'package:lui_fe/core/params/params.dart';
import 'package:lui_fe/features/auth/business/repositories/auth_repository.dart';
import 'package:lui_fe/features/auth/data/models/responses/login_response.dart';

import '../../../../core/errors/failure.dart';

class LoginUsecase{
  final AuthRepository repository;

  const LoginUsecase(this.repository);

  Future<Either<Failure, LoginResponse>> call(LoginParams loginParams)async{
    return repository.login(loginParams: loginParams);
  }
}