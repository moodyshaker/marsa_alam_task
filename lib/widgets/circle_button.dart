import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPress;
  final Color iconColor;
  final Color iconBackground;

  const CircleButton(
      {required this.icon,
      required this.iconBackground,
      required this.iconColor,
      required this.onPress,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.0,
      height: 35.0,
      decoration: BoxDecoration(
          color: iconBackground, borderRadius: BorderRadius.circular(17.5)),
      child: IconButton(
        icon: Icon(
          icon,
          color: iconColor,
          size: 20.0,
        ),
        onPressed: onPress,
      ),
    );
  }
}
