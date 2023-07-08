import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {

  //named constructor
  MyApp._internal();

  factory MyApp() => _instance;

  static final MyApp _instance = MyApp._internal(); //singleton

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
