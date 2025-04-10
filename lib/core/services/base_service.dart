import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lui_fe/cores/utils/app_interceptor.dart';
import 'package:lui_fe/cores/mixins/custom_toast_mixin.dart';

const Duration _defaultTimeout = Duration(minutes: 1); //60 seconds

abstract class BaseService {
    final Dio _dio = Dio();

    BaseService() {
        _dio.interceptors.add(AppInterceptor(_dio)); 
    }

    // GET
    get({
        required String url,
        Map<String, String>? headers,
        Map<String, dynamic>? params
    }) async {
        if (!hasNetwork()) {
            showCustomToast('You have no internet connection', isError: true);
            return; 
        }

        final Resposne<dynamic> response = await _dio.get(
            '${baseUrl}$url',
            queryParameters: params,
            options: Options(
                headers: {
                    'Authorization': 'Bearer ${anonKey}',
                    ...?headers
                },
                receiveTimeout: _defaultTimeout,
                sendTimeout: _defaultTimeout,
            );
        );
        return response;
    }
    
    // POST
    post({ 
        required String url,
        Map<String, String>? headers,
        Map<String, dynamic>? params
    }) async {
        if (!hasNetwork()) {
            showCustomToast('You have no internet connection', isError: true);
            return; 
        }

        final Resposne<dynamic> response = await _dio.post(
            '${baseUrl}$url',
            queryParameters: params,
            options: Options(
                headers: {
                    'Authorization': 'Bearer ${anonKey}',
                    ...?headers
                },
                receiveTimeout: _defaultTimeout,
                sendTimeout: _defaultTimeout,
            );
        );
        return response;
    }
    
}
