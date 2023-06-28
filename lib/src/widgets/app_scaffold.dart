import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottom;
  final bool? noneClickable;
  final Color? bgColor;

  const AppScaffold(
      {this.appBar,
        this.body,
        this.noneClickable,
        this.bgColor,
        this.bottom,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: noneClickable ?? false,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottom,
      ),
    );
  }
}
