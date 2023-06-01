import 'package:flutter/material.dart';
import 'mainscreen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const weatherApp());
}

class weatherApp extends StatelessWidget {
  const weatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,


      home: mainscreen(),
    );
  }
}
