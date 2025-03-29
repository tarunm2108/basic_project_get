import 'dart:convert';
import 'dart:io';

import 'package:basic_code_getx/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();

  static ApiService get instance => _instance;

  String baseUrl = "";
  final Dio _dio = Dio();
  static const connectionTimeOut = Duration(seconds: 10);
  static const receiveTimeOut = Duration(seconds: 30);

  ApiService._internal() {
    if (!kIsWeb) {
      _dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final HttpClient client =
          HttpClient(context: SecurityContext(withTrustedRoots: false));
          client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
          return client;
        },
      );
    }
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = connectionTimeOut;
    _dio.options.receiveTimeout = receiveTimeOut;
    // _dio.options.headers = {
    //   'user-agent': 'dio',
    //   'Accept': 'application/json',
    //   'Content-Type': 'application/json',
    // };
    // _dio.options.validateStatus = (status) => true;
    _dio.options.followRedirects = false;
  }

  Future<Response> get(String path, {Map<String, dynamic>? requestData}) async {
    try {
      Logger.instance.printLog("url => $baseUrl$path");
      Logger.instance.printLog("Header => ${_dio.options.headers}");
      if (requestData != null) {
        Logger.instance.printLog("get request => $requestData");
      }
      final response = await _dio.get(path, queryParameters: requestData);
      Logger.instance.printLog("$path ${jsonEncode(response.data)}");
      return response;
    } on DioException catch (e) {
      Logger.instance.printError("$path $e");
      return e.response!;
    }
  }

  Future<Response> getWithAuth(String path,
      {Map<String, dynamic>? requestData}) async {
    try {
      // _dio.options.headers = {
      //    'user-agent': 'dio',
      //    'Accept': 'application/json',
      //    'Content-Type': 'application/json',
      //    'Authorization': token,
      //  };
      Logger.instance.printLog("url => $baseUrl$path");
      Logger.instance.printLog("Header => ${_dio.options.headers}");
      if (requestData != null) {
        Logger.instance.printLog("get auth request => $requestData");
      }
      final response = await _dio.get(path, queryParameters: requestData);
      Logger.instance.printLog("$path ${jsonEncode(response.data)}");
      return response;
    } on DioException catch (e) {
      Logger.instance.printError("$path $e");
      return e.response!;
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      Logger.instance.printLog("url => $baseUrl$path");
      Logger.instance.printLog("Header => ${_dio.options.headers}");
      if (data != null) {
        Logger.instance.printLog("post request => $data");
      }
      final response = await _dio.post(path, data: data);
      Logger.instance.printLog("$path ${jsonEncode(response.data)}");
      return response;
    } on DioException catch (e) {
      Logger.instance.printError("$path $e");
      return e.response!;
    }
  }

  Future<Response> postWithAuth(String path, {dynamic data,bool? withoutRefresh}) async {
    try {
      // _dio.options.headers = {
      //    'user-agent': 'dio',
      //    'Accept': 'application/json',
      //    'Content-Type': 'application/json',
      //    'Authorization': token,
      //  };
      Logger.instance.printLog("url => $baseUrl$path");
      Logger.instance.printLog("Header => ${_dio.options.headers}");
      if (data != null) {
        Logger.instance.printLog("post auth request => $data");
      }
      final response = await _dio.post(path, data: data);
      Logger.instance.printLog("$path ${jsonEncode(response.data)}");
      return response;
    } on DioException catch (e) {
      Logger.instance.printError("$path $e");
      return e.response!;
    }
  }

  Future<Response> put(String path, {dynamic data}) async {
    try {
      Logger.instance.printLog("url => $baseUrl$path");
      Logger.instance.printLog("Header => ${_dio.options.headers}");
      if (data != null) {
        Logger.instance.printLog("put request => $data");
      }
      final response = await _dio.put(path, data: data);
      Logger.instance.printLog("$path ${jsonEncode(response.data)}");
      return response;
    } on DioException catch (e) {
      Logger.instance.printError("$path $e");
      return e.response!;
    }
  }

  Future<Response> putWithAuth(String path, {dynamic data}) async {
    try {
      // _dio.options.headers = {
      //    'user-agent': 'dio',
      //    'Accept': 'application/json',
      //    'Content-Type': 'application/json',
      //    'Authorization': token,
      //  };
      Logger.instance.printLog("url => $baseUrl$path");
      Logger.instance.printLog("Header => ${_dio.options.headers}");
      if (data != null) {
        Logger.instance.printLog("putAuth request => $data");
      }
      final response = await _dio.put(path, data: data);
      Logger.instance.printLog("$path ${jsonEncode(response.data)}");
      return response;
    } on DioException catch (e) {
      Logger.instance.printError("$path $e");
      return e.response!;
    }
  }

  Future<Response> delete(String path, {dynamic data}) async {
    try {
      Logger.instance.printLog("url => $baseUrl$path");
      Logger.instance.printLog("Header => ${_dio.options.headers}");
      if (data != null) {
        Logger.instance.printLog("delete request => $data");
      }
      final response = await _dio.delete(path, data: data);
      Logger.instance.printLog("$path ${jsonEncode(response.data)}");
      return response;
    } on DioException catch (e) {
      Logger.instance.printError("$path $e");
      return e.response!;
    }
  }

  Future<Response> deleteWithAuth(String path, {dynamic data}) async {
    try {
      // _dio.options.headers = {
      //    'user-agent': 'dio',
      //    'Accept': 'application/json',
      //    'Content-Type': 'application/json',
      //    'Authorization': token,
      //  };
      Logger.instance.printLog("url => $baseUrl$path");
      Logger.instance.printLog("Header => ${_dio.options.headers}");
      if (data != null) {
        Logger.instance.printLog("deleteAuth request => $data");
      }
      final response = await _dio.delete(path, data: data);
      Logger.instance.printLog("$path ${jsonEncode(response.data)}");
      return response;
    } on DioException catch (e) {
      Logger.instance.printError("$path $e");
      return e.response!;
    }
  }
}
