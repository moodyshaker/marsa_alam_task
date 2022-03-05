import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../model/add_new_note_arg.dart';
import '../screens/add_new_note.dart';
import '../screens/home.dart';
import '../screens/splash.dart';

Map<String, WidgetBuilder> routes = {
  Home.id: (_) => const Home(),
  SplashScreen.id: (_) => const SplashScreen(),
};

MaterialPageRoute? getOnGenerateRoute(RouteSettings settings) {
  if (settings.name == AddNewNote.id) {
    final AddNewNoteArg v = settings.arguments as AddNewNoteArg;
    return MaterialPageRoute(
      builder: (_) => AddNewNote(
        arg: v,
      ),
    );
  } else {
    return null;
  }
}

