import 'package:basic_code_getx/app_locale/lang_model.dart';
import 'package:get/get.dart';

class AppBaseController extends GetxController {
  final RxBool _setBusy = false.obs;
  LangModel selectedLang = languages.first;

  void showToast({required String? msg}) {
    if (msg?.isNotEmpty ?? false) {
      Get.showSnackbar(
        GetSnackBar(
          message: msg,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  bool get isBusy => _setBusy.value;

  set setBusy(bool value) {
    _setBusy.value = value;
    update();
  }
}
