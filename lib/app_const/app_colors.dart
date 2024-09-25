import 'package:flutter/material.dart';

class AppColors {
  static final AppColors instance = AppColors._internal();

  AppColors._internal();

  factory AppColors() => instance;

  static Color primaryColor = const Color(0xffFF731D);
}
