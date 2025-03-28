import 'package:dartz/dartz.dart';
import 'package:lui_fe/core/errors/failure.dart';
import 'package:lui_fe/core/params/params.dart';
import 'package:lui_fe/features/auth/business/repositories/auth_repository.dart';
import 'package:lui_fe/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:lui_fe/features/auth/data/models/responses/login_response.dart';
import 'package:lui_fe/features/auth/data/models/responses/register_response.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({ required this.remoteDataSource });
  
  @override
  Future<Either<Failure, LoginResponse>> login({required LoginParams loginParams}) async {
    try{
      print("📤 Sending data: ${loginParams.email} ${loginParams.password}");
      final response = await remoteDataSource.login(loginParams: loginParams);
      print('Response for Login: $response');
      return Right(response);
    }catch(e){
      if(e is ServerFailure){
        return Left(ServerFailure(statusCode : e.statusCode, errorData: e.errorData, errorMessage: e.errorMessage));
      }
      return Left(ServerFailure(statusCode: 500, errorData: null, errorMessage: "Unknown error occurred"));
    }
  }
  
  @override
  Future<Either<Failure, RegisterResponse>> register({required RegisterParams registerParams}) async {
    try {
      print("📤 Sending data: ${registerParams.name} ${registerParams.email} ${registerParams.password}");
      final response = await remoteDataSource.register(registerParams: registerParams);
      print('Response for Register: $response');
      return Right(response);
    } catch (e) {
      if (e is ServerFailure) {
        return Left(ServerFailure(statusCode: e.statusCode, errorData: e.errorData, errorMessage: e.errorMessage));
      }
      return Left(ServerFailure(statusCode: 500, errorData: null, errorMessage: "Unknown error occured"));
    }
  }

  
}