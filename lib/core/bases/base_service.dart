import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lui_fe/core/mixins/custom_toast_mixin.dart';

import '../utils/app_interceptor.dart';

const Duration _defaultTimeout = Duration(minutes: 1); //60 seconds

abstract class BaseService with CustomToastMixin{
    final Dio _dio = Dio();

    BaseService() {
        _dio.interceptors.add(AppInterceptor(_dio)); 
    }

    Future<bool> hasNetwork()async{
        try{
            final result = await InternetAddress.lookup('example.com');
            return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
        }on SocketException catch(_) {
            return false;
        }
    }
    // GET
    get({
        required String url,
        Map<String, String>? headers,
        Map<String, dynamic>? params
    }) async {
        if (!await hasNetwork()) {
            showCustomToast('You have no internet connection', isError: true);
            return; 
        }

        //TODO
        // final Response<dynamic> response = await _dio.get(
        //     '${baseUrl}$url',
        //     queryParameters: params,
        //     options: Options(
        //         headers: {
        //             'Authorization': 'Bearer ${anonKey}',
        //             ...?headers
        //         },
        //         receiveTimeout: _defaultTimeout,
        //         sendTimeout: _defaultTimeout,
        //     );
        // );
        // return response;
    }
    
    // POST
    post({ 
        required String url,
        Map<String, String>? headers,
        Map<String, dynamic>? params
    }) async {
        if (! await hasNetwork()) {
            showCustomToast('You have no internet connection', isError: true);
            return; 
        }

        //TODO
        // final Resposne<dynamic> response = await _dio.post(
        //     '${baseUrl}$url',
        //     queryParameters: params,
        //     options: Options(
        //         headers: {
        //             'Authorization': 'Bearer ${anonKey}',
        //             ...?headers
        //         },
        //         receiveTimeout: _defaultTimeout,
        //         sendTimeout: _defaultTimeout,
        //     );
        // );
        // return response;
    }
    
}
