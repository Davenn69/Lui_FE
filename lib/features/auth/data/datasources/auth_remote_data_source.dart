import 'package:dio/dio.dart';
import 'package:lui_fe/core/errors/failure.dart';
import 'package:lui_fe/core/network/api_endpoints.dart';
import 'package:lui_fe/core/network/dio_client.dart';
import 'package:lui_fe/core/params/params.dart';
import 'package:lui_fe/features/auth/data/models/responses/register_response.dart';

import '../models/responses/login_response.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponse> register({ required RegisterParams registerParams });
  Future<LoginResponse> login({ required LoginParams loginParams });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl(this.dioClient);
  
  @override
  Future<LoginResponse> login({required LoginParams loginParams}) async {
    try{
      dioClient.dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler){
            print("🚀 Request: ${options.method} ${options.uri}");
            print("Headers: ${options.headers}");
            print("Body: ${options.data}");
            return handler.next(options);
          },
          onResponse: (response, handler) {
            print("✅ Response: ${response.statusCode} - ${response.data}");
            return handler.next(response);
          },
          onError: (DioException e, handler) {
            print("❌ Dio Error: ${e.response?.statusCode} - ${e.response?.data}");
            return handler.next(e);
          },
        )
      );

      final response = await dioClient.dio.post(
        ApiEndpoints.login,
        data : {
          'email' : loginParams.email,
          'password' : loginParams.password
        },
          options: Options(
            headers: {'Content-Type': 'application/json'},
          )
      );
      print("Login response: ${response}");
      return LoginResponse.fromJson(response.data);
    }on DioException catch(e){
      throw ServerFailure(statusCode: e.response?.statusCode, errorData: e.response?.data, errorMessage: "Server error");
    }
  }
  
  @override
  Future<RegisterResponse> register({required RegisterParams registerParams}) async {
    print("API ENDPOIND: ${ApiEndpoints.register}");
    print('$registerParams');
    try {
      dioClient.dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          print("🚀 Request: ${options.method} ${options.uri}");
          print("Headers: ${options.headers}");
          print("Body: ${options.data}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("✅ Response: ${response.statusCode} - ${response.data}");
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print("❌ Dio Error: ${e.response?.statusCode} - ${e.response?.data}");
          return handler.next(e);
        },
      ));
      final response = await dioClient.dio.post(
        ApiEndpoints.register,
        data: {
          "name": registerParams.name,
          "email": registerParams.email,
          "password": registerParams.password,
        },
        options: Options(
          headers: {'Content-Type': 'application/json'},  
        )
      );
      print("Register response: ${response}");
      return RegisterResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure(statusCode: e.response?.statusCode, errorData: e.response?.data, errorMessage: "Server error");
    }
  }


}