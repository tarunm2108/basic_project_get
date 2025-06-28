import 'package:basic_code_getx/base/network_controller.dart';
import 'package:basic_code_getx/src/widgets/loader_widget.dart';
import 'package:basic_code_getx/src/widgets/no_internet_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingAction;
  final Widget? bottomWidget;
  final bool? isBusy;
  final bool? resizeToAvoidBottomInset;
  final bool? extendBodyBehindAppBar;
  final bool? canPop;
  final VoidCallback? onBack;
  final Color? bgColor;

  const AppScaffold({
    required this.body,
    this.appBar,
    this.isBusy,
    this.floatingAction,
    this.resizeToAvoidBottomInset,
    this.extendBodyBehindAppBar,
    this.bottomWidget,
    this.canPop,
    this.onBack,
    this.bgColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          onBack?.call();
        }
      },
      canPop: canPop ?? true,
      child: AbsorbPointer(
        absorbing: isBusy ?? false,
        child: Stack(
          children: [
            _body(),
            if (isBusy ?? false)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  alignment: Alignment.center,
                  child: const LoaderWidget(),
                ),
              ),
            Obx(() {
              if (Get.isRegistered<NetworkController>() &&
                  !(Get.find<NetworkController>().isConnected.value)) {
                return Positioned.fill(
                  child: Material(
                    color: Colors.white,
                    child: NoInternetWidget(
                      onRetry: () async {
                        if (await NetworkController.checkNetwork()) {
                          Get.find<NetworkController>().isConnected.value = true;
                        }
                      },
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(child: body),
      backgroundColor: bgColor ?? Colors.white,
      bottomNavigationBar: bottomWidget,
      floatingActionButton: floatingAction,
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}
