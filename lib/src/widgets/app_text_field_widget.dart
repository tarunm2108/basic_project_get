import 'package:basic_code_getx/src/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFieldWidget extends StatelessWidget {
  final TextStyle? textStyle;
  final String? hintText;
  final TextEditingController controller;
  final List<TextInputFormatter>? formatters;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final Widget? suffix;
  final bool? obscureText;
  final FocusNode? node;

  const AppTextFieldWidget({
    Key? key,
    required this.controller,
    this.textStyle,
    this.formatters,
    this.hintText,
    this.inputType,
    this.inputAction,
    this.suffix,
    this.node,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: textStyle,
      keyboardType: inputType,
      focusNode: node,
      textInputAction: inputAction ?? TextInputAction.done,
      inputFormatters: formatters,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black54),
        ),
        isDense: true,
        hintText: hintText,
        hintStyle: const TextStyle().regular.copyWith(
              color: Colors.black45,
              fontSize: 14,
            ),
        suffixIcon: suffix
      ),
    );
  }
}
