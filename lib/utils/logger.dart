import 'dart:developer';

import 'package:flutter/foundation.dart';

class Logger {
  static final Logger instance = Logger._internal();
  Logger._internal();
  factory Logger() => instance;

  void printInfo(dynamic data){
    if(kDebugMode){
      log("===> $data");
    }
  }
}