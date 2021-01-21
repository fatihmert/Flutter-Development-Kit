import 'package:flutter/material.dart';

import '../app/colors.dart';

ThemeData lightTheme() {
  return ThemeData(
      backgroundColor: ColorTable.backgroundColor,
      textTheme: TextTheme(
          headline1: TextStyle(
        color: Colors.black,
      )));
}
