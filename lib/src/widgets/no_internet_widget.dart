import 'package:basic_code_getx/src/extensions/space_extension.dart';
import 'package:basic_code_getx/src/widgets/app_button_widget.dart';
import 'package:basic_code_getx/src/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  final VoidCallback? onRetry;

  const NoInternetWidget({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off, size: 80, color: Colors.grey),
            16.toHeight,
            AppTextWidget('No Internet Connection'),
            8.toHeight,
            AppTextWidget(
              'Please check your network settings and try again.',
            ),
            24.toHeight,
            AppButtonWidget(onPressed: () => onRetry?.call(), title: "Retry")
          ],
        ),
      ),
    );
  }
}
