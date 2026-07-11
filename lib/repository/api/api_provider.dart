import 'package:basic_code_getx/app_const/app_config.dart';
import 'package:basic_code_getx/utils/logger.dart';
import 'package:get/get.dart';

/// GetConnect Alternative to Dio.
/// It's lightweight and built into GetX.
class ApiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = AppConfig.instance.baseUrl;
    httpClient.timeout = const Duration(seconds: 30);

    // Request Modifier
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Accept'] = 'application/json';
      Logger.instance.logInfo("${request.method} :- ${request.url}");
      return request;
    });

    // Response Modifier
    httpClient.addResponseModifier((request, response) {
      Logger.instance.logInfo("${request.url} ${response.body}");
      return response;
    });
    super.onInit();
  }

  // Example GET request
  Future<Response> getData(String path, {Map<String, dynamic>? query}) =>
      get(path, query: query);

  // Example POST request
  Future<Response> postData(String path, dynamic body) => post(path, body);
}
