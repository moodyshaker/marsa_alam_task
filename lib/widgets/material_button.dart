import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyMaterialButton extends StatelessWidget {
  final VoidCallback? onPressCallback;
  final Color color;
  final Color textColor;
  final String label;

  const MyMaterialButton(
      {required this.onPressCallback,
      required this.color,
      required this.textColor,
      required this.label,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressCallback,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          foregroundColor: MaterialStateProperty.all<Color>(textColor)),
      child: Text(label),
    );
  }
}
