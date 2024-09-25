import 'package:basic_code_getx/app_const/app_strings.dart';
import 'package:get/get.dart';

class Validator {
  static final Validator _instance = Validator._internal();

  static Validator get instance => _instance;

  Validator._internal();

  String? validEmail(String? email) {
    return email == null || email.trim().isEmpty
        ? AppStrings.fieldCanNotBeEmpty
        : GetUtils.isEmail(email.trim())
            ? null
            : AppStrings.validEmailMsg;
  }

  String? validFullName(String? name) {
    return name == null || name.trim().isEmpty
        ? AppStrings.fieldCanNotBeEmpty
        : GetUtils.isAlphabetOnly(GetUtils.removeAllWhitespace(name.trim()))
        ? null
        : AppStrings.validFullNameMsg;
  }

  String? validPassword(String? value) {
    return value == null || value.trim().isEmpty
        ? AppStrings.fieldCanNotBeEmpty
        : null;
  }

  String? validField(String? value) {
    return value == null || value.trim().isEmpty
        ? AppStrings.fieldCanNotBeEmpty
        : null;
  }
}
