import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Logger {
  static final Logger instance = Logger._internal();
  Logger._internal();
  factory Logger() => instance;

  void logInfo(dynamic data){
    if(kDebugMode){
      Get.log("===> $data");
    }
  }

  void logError(dynamic data){
    if(kDebugMode){
      Get.log("===> Error $data",isError: true);
    }
  }
}