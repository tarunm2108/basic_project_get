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
}
