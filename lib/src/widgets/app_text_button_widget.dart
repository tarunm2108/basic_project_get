import 'package:basic_code_getx/src/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

class AppTextButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final TextStyle? textStyle;

  const AppTextButtonWidget({
    required this.onPressed,
    required this.title,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
      ),
      child: Text(
        title,
        style: textStyle ?? const TextStyle().regular,
      ),
    );
  }
}
