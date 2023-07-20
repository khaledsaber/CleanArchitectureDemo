import 'package:clean_architecture_demo/presentation/theme_manager.dart';
import 'package:flutter/material.dart';


class MyApp extends StatefulWidget {


  //named constructor

  const MyApp._internal();

  factory MyApp() => _instance;

  static final MyApp _instance = MyApp._internal(); //singleton

  @override
  State<MyApp> createState() => _MyAppState();


}


class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: getApplicationTheme(),);

  }
}
