import 'dart:io';

import 'package:basic_code_getx/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart';

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
   if (connectivityResult.contains(ConnectivityResult.mobile) ||
       connectivityResult.contains(ConnectivityResult.wifi)) {
     return true;
   } else {
     return false;
   }
 }


 static String getTodayDate(String format) {
   return DateFormat(format).format(DateTime.now());
 }

 static String formatDate(String date, String format, String expectFormat,
     {bool? isUtc}) {
   if (date.isEmpty || date.toLowerCase() == 'null') return 'N/A';
   DateTime parse = DateFormat(format).parse(date, isUtc ?? false);
   return DateFormat(expectFormat).format(parse.toLocal());
 }

 static DateTime stringToDateTime(String date, String format) {
   DateTime parse = DateFormat(format).parse(date);
   return parse;
 }

 static String timeFormat(int time) {
   if (time >= 0 && time <= 9) {
     return '0$time';
   } else {
     return '$time';
   }
 }

 static bool getTimeDiff(String date) {
   DateTime parse = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
   parse.add(const Duration(seconds: 15));
   return DateTime.now().isBefore(parse);
 }

 static exitFromApp() {
   try {
     if (Platform.isAndroid) {
       SystemNavigator.pop();
     } else if (Platform.isIOS) {
       exit(0);
     }
   } catch (e) {
     Logger.instance.printError('____ $e');
   }
 }

 static DateTime findFirstDateOfTheWeek(DateTime dateTime) {
   return dateTime.subtract(Duration(days: dateTime.weekday - 1));
 }

 static DateTime findLastDateOfTheWeek(DateTime dateTime) {
   return dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
 }
}
