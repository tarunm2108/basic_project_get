import 'package:basic_code_getx/src/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final bool? noneClickable;

  const AppScaffold({
    this.appBar,
    this.body,
    this.noneClickable,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: noneClickable ?? false,
      child: Scaffold(
        appBar: appBar ?? const AppBarWidget(),
        body: body,
      ),
    );
  }
}
