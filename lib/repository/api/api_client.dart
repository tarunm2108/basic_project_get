import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static final ApiClient instance = ApiClient._internal();

  factory ApiClient() {
    return instance;
  }

  ApiClient._internal();

  static const String baseUrl = '';

  Future<http.Response> getMethod({
    required String method,
    Map<String, String>? header,
  }) async {
    final uri = Uri.parse("$baseUrl$method");
    debugPrint('Request url: ${uri.toString()}');
    final response = await http.get(Uri.parse("$baseUrl$method"));
    debugPrint('Response body: ${response.body}');
    return response;
  }

  Future<http.Response> postMethod({
    required String method,
    required Map<String, String> body,
    Map<String, String>? header,
  }) async {
    final uri = Uri.parse("$baseUrl$method");
    debugPrint('Request body: ${body.toString()}');
    debugPrint('Request url: ${uri.toString()}');
    final response = await http.post(
      Uri.parse("$baseUrl$method"),
      body: body,
      headers: header,
    );
    debugPrint('Response body: ${response.body}');
    return response;
  }

  Future<http.Response> postMultiPartMethod({
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
  }
}
