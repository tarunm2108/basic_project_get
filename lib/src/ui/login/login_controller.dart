import 'package:basic_code_getx/app_const/app_config.dart';
import 'package:basic_code_getx/utils/logger.dart';
import 'package:basic_code_getx/base/app_base_controller.dart';
import 'package:basic_code_getx/app_route/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends AppBaseController {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final emailNode = FocusNode();
  final passNode = FocusNode();
  RxBool hasHidePass = true.obs;

  void hideShowPass() {
    hasHidePass.value = !hasHidePass.value;
  }

  Future<void> loginTap() async {
    Logger.instance.logInfo("base url ${AppConfig.instance.baseUrl}");
    if (emailCtrl.text.trim().isEmpty) {
      showToast(msg: 'Please enter email.');
    } else if (passCtrl.text.trim().isEmpty) {
      showToast(msg: 'Please enter password.');
    } else if (!GetUtils.isEmail(emailCtrl.text.trim())) {
      showToast(msg: 'Please enter valid email.');
    } else {
      emailNode.unfocus();
      passNode.unfocus();
      setBusy = true;
      await Future.delayed(const Duration(seconds: 2));
      setBusy = false;
      Get.offAllNamed(AppRoutes.home);
    }
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    emailNode.dispose();
    passNode.dispose();
    super.onClose();
  }
}
