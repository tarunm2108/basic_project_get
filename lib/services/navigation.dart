import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navigation {
  static final Navigation _instance = Navigation._internal();

  static Navigation get instance => _instance;

  factory Navigation() => _instance;

  Navigation._internal();

  Future<dynamic>? navigateToView(
    Widget route, {
    dynamic arg,
    bool? fullscreenDialog,
  }) {
    return Get.to(() => route,
        arguments: arg, fullscreenDialog: fullscreenDialog ?? false);
  }

  Future<dynamic>? navigateTo(String route, {dynamic arg}) {
    return Get.toNamed(route, arguments: arg);
  }

  Future<dynamic>? replaceView(Widget route, {dynamic arg}) {
    return Get.off(route, arguments: arg);
  }

  Future<dynamic>? replace(String route, {dynamic arg}) {
    return Get.offNamed(route, arguments: arg);
  }

  void pop({dynamic result}) {
    return Get.back(result: result);
  }

  Future<dynamic>? popAllAndPushView(Widget route, {dynamic arg}) {
    return Get.offAll(route, arguments: arg);
  }

  Future<dynamic>? popAllAndPushName(String route, {dynamic arg}) {
    return Get.offAllNamed(route, arguments: arg);
  }

  void popRepeated(int time) {
    return Get.close(time);
  }
}
