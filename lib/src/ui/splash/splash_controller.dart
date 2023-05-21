import 'package:basic_code_getx/app_route/app_routes.dart';
import 'package:basic_code_getx/base/app_base_controller.dart';
import 'package:get/get.dart';

class SplashController extends AppBaseController {
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 2))
        .whenComplete(() => Get.offAllNamed(AppRoutes.login));
  }
}
