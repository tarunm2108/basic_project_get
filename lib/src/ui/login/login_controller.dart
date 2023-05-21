import 'package:basic_code_getx/base/app_base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends AppBaseController {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final emailNode = FocusNode();
  final passNode = FocusNode();
  bool _hasHidePass = true;

  void hideShowPass() {
    hasHidePass = !hasHidePass;
  }

  Future<void> loginTap() async {
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
      await Future.delayed(const Duration(seconds: 3));
      setBusy = false;
    }
  }

  bool get hasHidePass => _hasHidePass;

  set hasHidePass(bool value) {
    _hasHidePass = value;
    update();
  }
}
