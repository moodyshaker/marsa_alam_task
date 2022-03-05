import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../Provider/main_provider.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'Splash_Screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late MainProvider _mainProvider;

  @override
  void initState() {
    super.initState();
    _mainProvider = Provider.of<MainProvider>(context, listen: false);
    init();
    Future.delayed(const Duration(milliseconds: 1500),
        () => Navigator.pushReplacementNamed(context, Home.id));
  }

  void init() async {
    await _mainProvider.initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Center(
            child: Image.asset(
              'assets/app_logo.png',
              width: size.width,
              height: size.height * 0.3,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: CircularProgressIndicator.adaptive(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          ),
        )
      ],
    ));
  }
}
