import 'package:basic_code_getx/src/extensions/space_extension.dart';
import 'package:basic_code_getx/src/widgets/app_button_widget.dart';
import 'package:basic_code_getx/src/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:basic_code_getx/app_locale/locale_string/lang_key.dart';

class NoInternetWidget extends StatelessWidget {
  final VoidCallback? onRetry;

  const NoInternetWidget({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off, size: 80, color: Colors.grey),
            16.toHeight,
            AppTextWidget(LangKey.noInternetConnection.tr),
            8.toHeight,
            AppTextWidget(
              LangKey.pleaseCheckYourNetwork.tr,
            ),
            24.toHeight,
            AppButtonWidget(
              onPressed: () => onRetry?.call(),
              title: LangKey.retry.tr,
            )
          ],
        ),
      ),
    );
  }
}
