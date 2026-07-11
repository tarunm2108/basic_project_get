import 'package:basic_code_getx/base/network_controller.dart';
import 'package:basic_code_getx/repository/api/api_provider.dart';
import 'package:basic_code_getx/repository/api/api_service.dart';
import 'package:basic_code_getx/utils/shared_pre.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Inject core services that should live for the entire app lifecycle
    Get.put<NetworkController>(NetworkController(), permanent: true);
    Get.put<SharedPre>(SharedPre(), permanent: true);
    Get.put<ApiService>(ApiService.instance, permanent: true);
    Get.put<ApiProvider>(ApiProvider(), permanent: true);
  }
}
