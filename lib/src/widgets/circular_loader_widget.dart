import 'package:flutter/material.dart';

class CircularLoaderWidget extends StatelessWidget {
  final Color? color;
  final double? width;

  const CircularLoaderWidget({this.color,this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: width ?? 4,
      ),
    );
  }
}
