import 'package:flutter/material.dart';

class MyParentWidget extends StatelessWidget {
  final String? appbarTitle;
  final Widget bodyWidget;
  final List<Widget>? actions;
  final GestureTapCallback? onAddIconCallback;
  final WillPopCallback? popCallback;

  const MyParentWidget({
    required this.bodyWidget,
    this.onAddIconCallback,
    this.actions,
    this.popCallback,
    Key? key,
    this.appbarTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: popCallback,
      child: Scaffold(
        floatingActionButton: onAddIconCallback != null
            ? FloatingActionButton(
                child: const Icon(
                  Icons.add,
                ),
                onPressed: onAddIconCallback,
              )
            : null,
        appBar: appbarTitle != null
            ? AppBar(
                leading: null,
                title: Text(
                  appbarTitle!,
                ),
                actions: actions,
              )
            : null,
        body: appbarTitle == null ? SafeArea(child: bodyWidget) : bodyWidget,
      ),
    );
  }
}
