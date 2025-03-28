import 'package:dio/dio.dart';
import 'package:lui_fe/core/errors/failure.dart';
import 'package:lui_fe/core/network/api_endpoints.dart';
import 'package:lui_fe/core/network/dio_client.dart';
import 'package:lui_fe/features/dashboard/data/models/get_user_response.dart';

abstract class DashboardRemoteDataSource {
  Future<GetUserResponse> getUser({ required String userId });
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final DioClient dioClient;

  DashboardRemoteDataSourceImpl(this.dioClient);

  @override
  Future<GetUserResponse> getUser({required String userId}) async {
    print("API ENDPOIND: ${ApiEndpoints.getUser}");
    print('$userId');
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
        "ApiEndpoints.getUser/$userId",
        options: Options(
          headers: {'Content-Type': 'application/json'},  
        )
      );
      print("Get User response: ${response}");
      return GetUserResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure(statusCode: e.response?.statusCode, errorData: e.response?.data, errorMessage: "Server error");
    }
  }
}