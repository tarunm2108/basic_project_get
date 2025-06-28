import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Logger {
  static final Logger instance = Logger._internal();
  Logger._internal();
  factory Logger() => instance;

  void printLog(dynamic data){
    if(kDebugMode){
      Get.log("===> $data");
    }
  }

  void printError(dynamic data){
    if(kDebugMode){
      Get.log("===> Error $data",isError: true);
    }
  }
}