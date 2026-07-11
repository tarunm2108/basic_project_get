import 'package:basic_code_getx/app_locale/locale_string/en.dart';
import 'package:basic_code_getx/app_locale/locale_string/es.dart';
import 'package:basic_code_getx/app_locale/locale_string/hi.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en": en,
    "es": es,
    "hi": hi,
  };
}
