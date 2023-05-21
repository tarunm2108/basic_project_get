import 'package:flutter/cupertino.dart';

extension SpaceExtension on int {
  SizedBox get toSpace => SizedBox(
        height: toDouble(),
        width: toDouble(),
      );
}
