import 'package:basic_code_getx/src/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  static final InputBorder enableBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(width: 1, color: Colors.black),
  ).copyWith(
    borderRadius: BorderRadius.all(Radius.circular(5.r)),
  );

  static final InputBorder errorBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(width: 1, color: Colors.red),
  ).copyWith(
    borderRadius: BorderRadius.all(Radius.circular(5.r)),
  );

  static final _defaultTextStyle = const TextStyle().regular.copyWith(
        color: Colors.black,
        fontSize: 18.sp,
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      style: textStyle ?? _defaultTextStyle,
      keyboardType: inputType,
      focusNode: node,
      readOnly: readOnly ?? false,
      textInputAction: inputAction ?? TextInputAction.done,
      inputFormatters: formatters,
      obscureText: obscureText ?? false,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      decoration: decoration ??
          InputDecoration(
            border: enableBorder,
            enabledBorder: enableBorder,
            focusedBorder: enableBorder,
            errorBorder: errorBorder,
            isDense: true,
            hintText: hintText,
            contentPadding: EdgeInsets.fromLTRB(18.w, 18.h, 18.w, 18.h),
            hintStyle: _defaultTextStyle,
            suffixIcon: suffix,
            prefixIcon: prefix,
          ),
      validator: validator,
    );
  }
}
