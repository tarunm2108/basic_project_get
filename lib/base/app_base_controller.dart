import 'package:basic_code_getx/app_locale/lang_model.dart';
import 'package:get/get.dart';

class AppBaseController extends GetxController {
  bool _setBusy = false;
  LangModel _selectedLang = languages.first;

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

  bool get setBusy => _setBusy;

  set setBusy(bool value) {
    _setBusy = value;
    update();
  }

  LangModel get selectedLang => _selectedLang;

  set selectedLang(LangModel value) {
    _selectedLang = value;
    update();
  }
}
