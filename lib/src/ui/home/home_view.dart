import 'package:basic_code_getx/src/ui/home/home_controller.dart';
import 'package:basic_code_getx/src/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isBusy: controller.isBusyRx,
      appBar: AppBar(
        title: const Text('Home Boilerplate'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.language),
            onSelected: (String languageCode) {
              Get.updateLocale(Locale(languageCode));
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'en',
                child: Text('English'),
              ),
              const PopupMenuItem<String>(
                value: 'es',
                child: Text('Spanish'),
              ),
              const PopupMenuItem<String>(
                value: 'hi',
                child: Text('Hindi'),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.refreshData,
          )
        ],
      ),
      // Use controller.obx to handle StateMixin states seamlessly
      body: controller.obx(
        (data) => ListView.builder(
          itemCount: data?.length ?? 0,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: Text(data![index]),
            );
          },
        ),
        onLoading: const Center(child: CircularProgressIndicator()),
        onEmpty: const Center(child: Text('No data found.')),
        onError: (error) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
