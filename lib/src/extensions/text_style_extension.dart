import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get regular => copyWith(
        fontWeight: FontWeight.w400,
      );

  TextStyle get bold => copyWith(
        fontWeight: FontWeight.w700,
      );

  TextStyle get italic => copyWith(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      );

  TextStyle get heading1Style => copyWith(
        fontSize: 28.0.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );

  TextStyle get heading2Style => copyWith(
        fontSize: 22.0.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );

  TextStyle get bodyStyle => copyWith(
        fontSize: 16.0.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black87,
      );

  TextStyle get captionStyle => copyWith(
        fontSize: 12.0.sp,
        fontWeight: FontWeight.w300,
        color: Colors.grey,
      );

  TextStyle get buttonTextStyle => copyWith(
        fontSize: 16.0.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      );
}
