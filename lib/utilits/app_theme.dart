import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marsa_alam_task/utilits/colors.dart';



final ThemeData myAndroidAppTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: primaryColor,
 appBarTheme: AppBarTheme(
  backgroundColor: primaryColor,
 ),
  accentColor: primaryColor
);
 CupertinoThemeData myIOSAppTheme = CupertinoThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
 );
