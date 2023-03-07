import 'package:flutter/material.dart';

import '../presentation/theme_manager.dart';


class MyApp extends StatefulWidget {



  // private named constructor
  MyApp._internal();

  int appState = 0;

  static final instance = MyApp._internal(); // singleton

  factory MyApp()=>instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: getApplicationTheme(),);
  }
}


