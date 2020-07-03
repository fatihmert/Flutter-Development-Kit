import 'package:flutter/material.dart';
import 'package:flutterarch/ui/views/startup/startup_view.dart';
import 'app/locator.dart';
import 'package:get/get.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Get.key,
      home: StartupView(),
    );
  }
}
