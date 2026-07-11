import 'dart:convert';

import 'package:basic_code_getx/app_const/app_config.dart';
import 'package:basic_code_getx/utils/logger.dart';
import 'package:dio/dio.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();

  static ApiService get instance => _instance;

  final Dio _dio = Dio();
  static const connectionTimeOut = Duration(seconds: 10);
  static const receiveTimeOut = Duration(seconds: 30);

  ApiService._internal() {

    _dio.options.baseUrl = AppConfig.instance.baseUrl;
    _dio.options.connectTimeout = connectionTimeOut;
    _dio.options.receiveTimeout = receiveTimeOut;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          Logger.instance
              .logInfo("${options.method.toUpperCase()} :- ${options.uri}");
          Logger.instance.logInfo("Header => ${options.headers}");
          Logger.instance.logInfo("Request => ${options.data}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          Logger.instance.logInfo(
              "${response.requestOptions.path} ${jsonEncode(response.data)}");
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // Handle errors globally
          return handler.next(e);
        },
      ),
    );
    _dio.options.followRedirects = false;
  }

  Map<String, String> getHeader({bool isAuth = false}) {
    String token = 'Bearer';
    return isAuth
        ? {
            'user-agent': 'dio',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': token,
          }
        : {
            'user-agent': 'dio',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          };
  }

  Future<Response> get(String path, {Map<String, dynamic>? requestData}) async {
    try {
      _dio.options.headers = getHeader(isAuth: true);
      final response = await _dio.get(path, queryParameters: requestData);
      return response;
    } on DioException catch (e) {
      Logger.instance.logError("$path $e");
      return e.response ?? Response(requestOptions: e.requestOptions, statusCode: 500, statusMessage: e.message);
    }
  }

  Future<Response> getWithAuth(String path,
      {Map<String, dynamic>? requestData}) async {
    try {
      _dio.options.headers = getHeader();
      final response = await _dio.get(path, queryParameters: requestData);
      return response;
    } on DioException catch (e) {
      Logger.instance.logError("$path $e");
      return e.response ?? Response(requestOptions: e.requestOptions, statusCode: 500, statusMessage: e.message);
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      _dio.options.headers = getHeader(isAuth: true);
      final response = await _dio.post(path, data: data);
      return response;
    } on DioException catch (e) {
      Logger.instance.logError("$path $e");
      return e.response ?? Response(requestOptions: e.requestOptions, statusCode: 500, statusMessage: e.message);
    }
  }

  Future<Response> postWithAuth(String path,
      {dynamic data, bool? withoutRefresh}) async {
    try {
      _dio.options.headers = getHeader();
      final response = await _dio.post(path, data: data);
      return response;
    } on DioException catch (e) {
      Logger.instance.logError("$path $e");
      return e.response ?? Response(requestOptions: e.requestOptions, statusCode: 500, statusMessage: e.message);
    }
  }

  Future<Response> put(String path, {dynamic data}) async {
    try {
      _dio.options.headers = getHeader(isAuth: true);
      final response = await _dio.put(path, data: data);
      return response;
    } on DioException catch (e) {
      Logger.instance.logError("$path $e");
      return e.response ?? Response(requestOptions: e.requestOptions, statusCode: 500, statusMessage: e.message);
    }
  }

  Future<Response> putWithAuth(String path, {dynamic data}) async {
    try {
      _dio.options.headers = getHeader();
      final response = await _dio.put(path, data: data);
      return response;
    } on DioException catch (e) {
      Logger.instance.logError("$path $e");
      return e.response ?? Response(requestOptions: e.requestOptions, statusCode: 500, statusMessage: e.message);
    }
  }

  Future<Response> delete(String path, {dynamic data}) async {
    try {
      _dio.options.headers = getHeader(isAuth: true);
      final response = await _dio.delete(path, data: data);
      Logger.instance.logInfo("$path ${jsonEncode(response.data)}");
      return response;
    } on DioException catch (e) {
      Logger.instance.logError("$path $e");
      return e.response ?? Response(requestOptions: e.requestOptions, statusCode: 500, statusMessage: e.message);
    }
  }

  Future<Response> deleteWithAuth(String path, {dynamic data}) async {
    try {
      _dio.options.headers = getHeader();
      final response = await _dio.delete(path, data: data);
      return response;
    } on DioException catch (e) {
      Logger.instance.logError("$path $e");
      return e.response ?? Response(requestOptions: e.requestOptions, statusCode: 500, statusMessage: e.message);
    }
  }
}
