import 'package:basic_code_getx/src/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  const AppTextWidget(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.textDirection,
    this.locale,
    this.strutStyle,
    this.textScaler,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final TextDirection? textDirection;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final TextScaler? textScaler;

  /// Creates a [AppTextWidget] with `heading1Style`.
  AppTextWidget.heading1(
    this.text, {
    super.key,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.textDirection,
    this.locale,
    this.strutStyle,
    this.textScaler,
  }) : style = TextStyle().heading1Style;

  /// Creates a [AppTextWidget] with `heading2Style`.
  AppTextWidget.heading2(
    this.text, {
    super.key,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.textDirection,
    this.locale,
    this.strutStyle,
    this.textScaler,
  }) : style = TextStyle().heading2Style;

  /// Creates a [AppTextWidget] with `bodyStyle`.
  AppTextWidget.body(
    this.text, {
    super.key,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.textDirection,
    this.locale,
    this.strutStyle,
    this.textScaler,
  }) : style = TextStyle().bodyStyle;

  /// Creates a [AppTextWidget] with `captionStyle`.
  AppTextWidget.caption(
    this.text, {
    super.key,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.textDirection,
    this.locale,
    this.strutStyle,
    this.textScaler,
  }) : style = TextStyle().captionStyle;

  /// Creates a [AppTextWidget] with `buttonTextStyle`.
  AppTextWidget.button(
    this.text, {
    super.key,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.textDirection,
    this.locale,
    this.strutStyle,
    this.textScaler,
  }) : style = TextStyle().buttonTextStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? TextStyle().regular,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      textDirection: textDirection,
      locale: locale,
      strutStyle: strutStyle,
      textScaler: textScaler,
    );
  }
}
