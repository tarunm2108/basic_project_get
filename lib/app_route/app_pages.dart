import 'package:basic_code_getx/app_route/app_routes.dart';
import 'package:basic_code_getx/src/ui/login/login_view.dart';
import 'package:basic_code_getx/src/ui/splash/splash_view.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
    ),
  ];
}
