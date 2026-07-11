import 'package:basic_code_getx/app_const/app_strings.dart';
import 'package:basic_code_getx/app_locale/app_translation.dart';
import 'package:basic_code_getx/app_route/app_pages.dart';
import 'package:basic_code_getx/app_route/app_routes.dart';

import 'package:basic_code_getx/base/app_binding.dart';
import 'package:basic_code_getx/app_const/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          initialRoute: AppRoutes.splash,
          initialBinding: AppBinding(),
          getPages: AppPages.routes,
          translationsKeys: AppTranslation.translationsKeys,
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('en'),
        );
      },
    );
  }
}
