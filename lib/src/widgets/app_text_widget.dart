import 'package:basic_code_getx/src/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

enum AppTextType { regular, heading1, heading2, body, caption, button }

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
  }) : _type = AppTextType.regular;

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
  final AppTextType _type;

  /// Creates a [AppTextWidget] with `heading1Style`.
  const AppTextWidget.heading1(
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
  })  : style = null,
        _type = AppTextType.heading1;

  /// Creates a [AppTextWidget] with `heading2Style`.
  const AppTextWidget.heading2(
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
  })  : style = null,
        _type = AppTextType.heading2;

  /// Creates a [AppTextWidget] with `bodyStyle`.
  const AppTextWidget.body(
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
  })  : style = null,
        _type = AppTextType.body;

  /// Creates a [AppTextWidget] with `captionStyle`.
  const AppTextWidget.caption(
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
  })  : style = null,
        _type = AppTextType.caption;

  /// Creates a [AppTextWidget] with `buttonTextStyle`.
  const AppTextWidget.button(
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
  })  : style = null,
        _type = AppTextType.button;

  TextStyle get _textStyle {
    if (style != null) return style!;
    switch (_type) {
      case AppTextType.heading1:
        return const TextStyle().heading1Style;
      case AppTextType.heading2:
        return const TextStyle().heading2Style;
      case AppTextType.body:
        return const TextStyle().bodyStyle;
      case AppTextType.caption:
        return const TextStyle().captionStyle;
      case AppTextType.button:
        return const TextStyle().buttonTextStyle;
      case AppTextType.regular:
        return const TextStyle().regular;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _textStyle,
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
