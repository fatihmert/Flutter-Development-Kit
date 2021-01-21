import 'package:flutter/material.dart';

import 'package:flutterarch/themes/dark.dart';
import 'package:flutterarch/themes/light.dart';

class ThemeTable {
  static List<ThemeData> get getThemes => [dark, light];

  static ThemeData get dark => darkTheme();
  static ThemeData get light => lightTheme();
}
