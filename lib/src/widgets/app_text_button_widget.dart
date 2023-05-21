import 'package:basic_code_getx/src/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

class AppTextButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const AppTextButtonWidget({
    required this.onPressed,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle().bold,
      ),
    );
  }
}
