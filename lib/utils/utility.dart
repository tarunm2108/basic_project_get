import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Utility {

 static void changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    Get.updateLocale(locale);
  }

 static void showToast({required String? msg}) {
   if (msg?.isNotEmpty ?? false) {
     Get.showSnackbar(
       GetSnackBar(
         message: msg,
         duration: const Duration(seconds: 3),
       ),
     );
   }
 }

 static Future<bool> checkPermission(Permission permission) async {
   final status = await permission.status;
   if (status.isLimited || status.isGranted) {
     return true;
   } else {
     final requestResult = await permission.request();
     if (requestResult.isLimited || requestResult.isGranted) {
       return true;
     } else {
       openAppSettings();
       return false;
     }
   }
 }

 static Future<bool> checkNetwork() async {
   var connectivityResult = await Connectivity().checkConnectivity();
   if (connectivityResult == ConnectivityResult.mobile ||
       connectivityResult == ConnectivityResult.wifi) {
     return true;
   } else {
     return false;
   }
 }
}
