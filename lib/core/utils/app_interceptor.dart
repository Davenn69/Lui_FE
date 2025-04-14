import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'service_helper.dart'; 

class AppInterceptor extends Interceptor {
    final Dio dio;

    AppInterceptor(this.dio);

    @override
      void onError(DioException err, ErrorInterceptorHandler handler) {
        if (kDebugMode) {
            print('==== ERROR INTERCEPTOR START ====');
            print('$err');
            print('uri ${err.requestOptions.uri}');
            print('path ${err.requestOptions.path}');
            print('params ${err.requestOptions.queryParameters}');
            print('message ${err.message}');
            print('response ${err.response}');
            print('error status code ${err.response?.statusCode}');
            print('==== ERROR INTERCEPTOR END ====');
        }
        switch (err.type) {
            case DioExceptionType.connectionTimeout:
            case DioExceptionType.sendTimeout:
            case DioExceptionType.receiveTimeout:
                //TODO: Show error timeout
                break;
            case DioExceptionType.badResponse: 
                DioException? error;
                String? message = err?.response?.data['message'];
                switch (err?.response?.statusCode) {
                    case 400:
                        error = BadRequestException(
                            errorMessage: message,
                            requestOptions: err.requestOptions,
                        );
                        break;
                    case 401: 
                        error = UnauthorizedException(requestOptions: err.requestOptions);
                        break;
                    case 404:
                        error = NotFoundException(requestOptions: err.requestOptions);
                        break;
                    case 500:
                        error = InternalServerErrorException(
                            errorMessage: message,    
                            requestOptions: err.requestOptions
                        );
                        break;
                }
                if (error == null) break;
                throw error;
            default: 
                break;
        }
        return handler.next(err);
      }
}
