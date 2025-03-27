import 'package:dio/dio.dart';
import 'package:lui_fe/core/network/api_endpoints.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    )
  );

  Dio get dio => _dio;
}