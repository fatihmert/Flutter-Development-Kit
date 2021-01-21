import 'package:flutter/material.dart';
import 'package:flutterarch/app/theme.dart';
import 'package:flutterarch/ui/views/startup/startup_view.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'app/locator.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await setupLocator();
  await ThemeManager.initialise();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      themes: ThemeTable.getThemes,
      defaultThemeMode: ThemeMode.light,
      darkTheme: ThemeTable.dark,
      lightTheme: ThemeTable.light,
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: Get.key,
        home: StartupView(),
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        // theme: ThemeTable.dark,
      ),
    );
  }
}
