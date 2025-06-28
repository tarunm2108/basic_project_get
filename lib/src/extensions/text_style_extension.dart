import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get regular => const TextStyle(
        fontWeight: FontWeight.w400,
      );

  TextStyle get bold => const TextStyle(
        fontWeight: FontWeight.w700,
      );

  TextStyle get italic => const TextStyle(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      );

  TextStyle get heading1Style => const TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );

  TextStyle get heading2Style => const TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );

  TextStyle get bodyStyle => const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: Colors.black87,
      );

  TextStyle get captionStyle => const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w300,
        color: Colors.grey,
      );

  TextStyle get buttonTextStyle => const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      );
}
