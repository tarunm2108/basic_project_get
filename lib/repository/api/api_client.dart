import 'dart:convert';

import 'package:basic_code_getx/utils/logger.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static final ApiClient instance = ApiClient._internal();
  static const String baseUrl = "";
  final _dio = Dio();

  factory ApiClient() => instance;

  ApiClient._internal();

  void init(){
    _dio.options.baseUrl = baseUrl;
    _dio.options.headers = {};
  }

  Future<Response> getMethod({
    required String method,
    Map<String, String>? header,
  }) async {
    final uri = Uri.parse("$baseUrl$method");
    Logger.instance.printInfo('Request url: ${uri.toString()}');
    final response = await _dio.get(uri.toString());
    Logger.instance.printInfo('Response body: ${jsonEncode(response.data)}');
    return response;
  }

  Future<Response> postMethod({
    required String method,
    required Map<String, String> body,
    Map<String, String>? header,
  }) async {
    final uri = Uri.parse("$baseUrl$method");
    Logger.instance.printInfo('Request url: ${uri.toString()}');
    Logger.instance.printInfo('Request body: $body');
    final response = await _dio.post(
      uri.toString(),
      data: body,
    );
    Logger.instance.printInfo('Response body: ${jsonEncode(response.data)}');
    return response;
  }

  /*Future<http.Response> postMultiPartMethod({
    required String method,
    required Map<String, String> body,
    required List<http.MultipartFile> files,
    Map<String, String>? header,
  }) async {
    final uri = Uri.parse("$baseUrl$method");
    debugPrint('Request body: ${body.toString()}');
    debugPrint('Request url: ${uri.toString()}');
    var request = http.MultipartRequest('POST', uri);
    request.files.addAll(files);
    request.fields.addAll(body);
    request.headers.addAll(header ?? {});
    final response = await request.send();
    final result = await http.Response.fromStream(response);
    debugPrint('Response body: ${result.body}');
    return result;
  }*/
}
