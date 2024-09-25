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
  final Widget? prefix;
  final bool? obscureText;
  final bool? readOnly;
  final FocusNode? node;
  final TextCapitalization? textCapitalization;
  final VoidCallback? onTap;
  final InputDecoration? decoration;
  final String? Function(String? value)? validator;

  const AppTextFieldWidget({
    super.key,
    required this.controller,
    this.textStyle,
    this.formatters,
    this.hintText,
    this.inputType,
    this.inputAction,
    this.suffix,
    this.prefix,
    this.node,
    this.obscureText,
    this.textCapitalization,
    this.readOnly,
    this.onTap,
    this.decoration,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      style: textStyle ??
          const TextStyle().regular.copyWith(
                color: Colors.black,
                fontSize: 18,
              ),
      keyboardType: inputType,
      focusNode: node,
      readOnly: readOnly ?? false,
      textInputAction: inputAction ?? TextInputAction.done,
      inputFormatters: formatters,
      obscureText: obscureText ?? false,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      decoration: decoration ??
          InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(width: 1, color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(width: 1, color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(width: 1, color: Colors.black),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(width: 1, color: Colors.red),
            ),
            isDense: true,
            hintText: hintText,
            contentPadding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
            hintStyle: const TextStyle().regular.copyWith(
                  color: Colors.black,
                  fontSize: 18,
                ),
            suffixIcon: suffix,
            prefixIcon: prefix,
          ),
      validator: validator,
    );
  }
}
