import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marsa_alam_task/utilits/colors.dart';

final ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    colorScheme: ThemeData().colorScheme.copyWith(primary: primaryColor, secondary: primaryColor),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
    ),
);
