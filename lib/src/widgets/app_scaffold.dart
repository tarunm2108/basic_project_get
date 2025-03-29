import 'package:basic_code_getx/src/widgets/loader_widget.dart';
import 'package:flutter/material.dart';

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
      onPopInvokedWithResult: (value, result) {
        if (!value) {
          if (onBack != null) {
            onBack!();
          }
        }
      },
      canPop: canPop ?? true,
      child: AbsorbPointer(
        absorbing: isBusy ?? false,
        child: Stack(
          children: [
            Positioned.fill(
              child: Scaffold(
                appBar: appBar,
                body: SafeArea(child: body),
                backgroundColor: bgColor ?? Colors.white,
                bottomNavigationBar: bottomWidget,
                floatingActionButton: floatingAction,
                extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
                resizeToAvoidBottomInset: resizeToAvoidBottomInset,
              ),
            ),
            Positioned.fill(
              child: isBusy ?? false
                  ? Container(
                      color: Colors.black.withOpacity(0.3),
                      alignment: Alignment.center,
                      child: const LoaderWidget(),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
