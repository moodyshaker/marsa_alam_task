import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marsa_alam_task/screens/splash.dart';
import 'package:marsa_alam_task/utilits/app_theme.dart';
import 'package:provider/provider.dart';
import 'Provider/main_provider.dart';
import 'Utilits/const.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ChangeNotifierProvider(
      create: (_) => MainProvider(),
      child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: SplashScreen.id,
              theme: appTheme,
              title: 'MarsaTask',
              routes: routes,
              onGenerateRoute: getOnGenerateRoute,
            ),
    );
  }
}
