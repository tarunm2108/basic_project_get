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
            const SizedBox(height: 16),
            const AppTextWidget('No Internet Connection'),
            const SizedBox(height: 8),
            const AppTextWidget(
              'Please check your network settings and try again.',
            ),
            const SizedBox(height: 24),
            AppButtonWidget(onPressed: () => onRetry?.call(), title: "Retry")
          ],
        ),
      ),
    );
  }
}
