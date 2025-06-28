import 'package:basic_code_getx/app_locale/locale_string/lang_key.dart';
import 'package:basic_code_getx/src/extensions/space_extension.dart';
import 'package:basic_code_getx/src/ui/login/login_controller.dart';
import 'package:basic_code_getx/src/widgets/app_bar_widget.dart';
import 'package:basic_code_getx/src/widgets/app_button_widget.dart';
import 'package:basic_code_getx/src/widgets/app_scaffold.dart';
import 'package:basic_code_getx/src/widgets/app_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AppScaffold(
        isBusy: controller.isBusy,
        appBar: AppBarWidget(title: LangKey.login.tr),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              AppTextFieldWidget(
                controller: controller.emailCtrl,
                hintText: LangKey.email.tr,
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                node: controller.emailNode,
              ),
              20.toHeight,
              AppTextFieldWidget(
                controller: controller.passCtrl,
                hintText: LangKey.password.tr,
                inputType: TextInputType.text,
                inputAction: TextInputAction.done,
                node: controller.passNode,
                obscureText: controller.hasHidePass.value,
                suffix: InkWell(
                  onTap: () => controller.hideShowPass(),
                  child: Icon(controller.hasHidePass.value
                      ? Icons.visibility_off
                      : Icons.visibility),
                ),
              ),
              20.toHeight,
              AppButtonWidget(
                onPressed: () => controller.loginTap(),
                title: LangKey.login.tr,
                showLoader: controller.isBusy,
              ),
            ],
          ),
        ),
      );
    });
  }
}
