import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:short_video_flutter/utils/logger.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  late Dio dio;

  late SharedPreferences prefs;

  factory HttpUtil() {
    return _instance;
  }

  HttpUtil._internal();

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    BaseOptions options = BaseOptions(
      baseUrl: 'https://api.clipdrama.com',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Accept-language': 'en',
        'device-brand': prefs.getString('platform') == '1' ? 'Android' : 'ios',
      },
    );

    dio = Dio(options);

    // 添加拦截器来动态设置 token
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // 异步获取 SharedPreferences

          final token = prefs.getString('token') ?? '';

          // 动态添加 token 到请求头
          options.headers['token'] = token;

          // 打印请求信息（可选）
          logger.d('REQUEST[${options.method}] => PATH: ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // 响应拦截（可选）
          logger.d(
            'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
          );
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // 错误拦截（可选）
          logger.d(
            'ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}',
          );
          return handler.next(e);
        },
      ),
    );
  }

  // GET 请求
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
      return null;
    }
  }

  // POST 请求
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
      return null;
    }
  }

  // 错误处理
  void _handleError(DioException e) {
    String errorMsg;
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        errorMsg = 'Connection timeout. Please check your network.';
        break;
      case DioExceptionType.sendTimeout:
        errorMsg = 'Request timed out.';
        break;
      case DioExceptionType.receiveTimeout:
        errorMsg = 'Response timed out.';
        break;
      case DioExceptionType.badResponse:
        errorMsg = 'Server error. Please try again later.';
        break;
      case DioExceptionType.cancel:
        errorMsg = 'Request was cancelled.';
        break;
      default:
        errorMsg = 'An unknown network error occurred.';
        break;
    }
    Get.snackbar(
      'Network Error',
      errorMsg,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
    );
  }
}
