import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SpaceExtension on num {
  SizedBox get toSpace => SizedBox(height: toDouble().h, width: toDouble().w);

  SizedBox get toHeight => SizedBox(height: toDouble().h);

  SizedBox get toWidth => SizedBox(width: toDouble().w);
}
