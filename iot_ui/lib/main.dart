import 'package:flutter/material.dart';
import 'package:iot_ui/menu/main_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Side Bar App",
      home: MainMenu(),
    );
  }
}