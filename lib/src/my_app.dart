import 'package:basic_code_getx/app_const/app_strings.dart';
import 'package:basic_code_getx/app_locale/app_translation.dart';
import 'package:basic_code_getx/app_route/app_pages.dart';
import 'package:basic_code_getx/app_route/app_routes.dart';
import 'package:basic_code_getx/base/network_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.splash,
      initialBinding: BindingsBuilder(() {
        Get.put(NetworkController(), permanent: true);
      }),
      getPages: AppPages.routes,
      translationsKeys: AppTranslation.translationsKeys,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en'),
    );
  }
}
