import 'package:dartz/dartz.dart';
import 'package:lui_fe/core/errors/failure.dart';
import 'package:lui_fe/core/params/params.dart';
import 'package:lui_fe/features/auth/business/repositories/auth_repository.dart';
import 'package:lui_fe/features/auth/data/models/responses/register_response.dart';

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase(this.repository);

  Future<Either<Failure, RegisterResponse>> call(RegisterParams registerParams) async {
    return await repository.register(registerParams: registerParams);
  }
}