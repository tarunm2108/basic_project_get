import 'package:basic_code_getx/base/app_base_controller.dart';
import 'package:get/get.dart';

class HomeController extends AppBaseController with StateMixin<List<String>> {
  @override
  void onInit() {
    super.onInit();
    _fetchMockData();
  }

  void _fetchMockData() async {
    change(null, status: RxStatus.loading());
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      // In a real app, use: final response = await Get.find<ApiProvider>().getData('/endpoint');
      final data = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
      
      if (data.isEmpty) {
        change(data, status: RxStatus.empty());
      } else {
        change(data, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void refreshData() {
    _fetchMockData();
  }
}
