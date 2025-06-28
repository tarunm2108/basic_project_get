import 'dart:async';

import 'package:basic_code_getx/utils/logger.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkController extends GetxController {
  final RxBool isConnected = true.obs;
  late StreamSubscription<InternetConnectionStatus> networkListener;

  @override
  void onInit() {
    _startListening();
    super.onInit();
  }

  void _startListening() {
    InternetConnectionChecker.instance.hasConnection.then((value) {
      isConnected.value = value;
    });

    networkListener = InternetConnectionChecker.instance.onStatusChange.listen((status) {
      Logger.instance.printLog("Network status changed: $status");
      isConnected.value = status == InternetConnectionStatus.connected;
    });
  }

  static Future<bool> checkNetwork() async {
    return await InternetConnectionChecker.instance.hasConnection;
  }

  @override
  void onClose() {
    networkListener.cancel();
    super.onClose();
  }
}