import 'package:flutter/material.dart';
import 'package:flutterarch/app/theme.dart';
import 'package:stacked_themes/stacked_themes.dart';
import '../../../app/helper.dart';
import '../../../app/locator.dart';
import '../home/home_view.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class StartupViewModel extends BaseViewModel {
  final ThemeService _themeService = locator<ThemeService>();

  String _title = "HookUp";
  String get title => _title;

  void updateTitle(String newTitle) {
    _title = newTitle;
    notifyListeners();
  }

  void navigateToHome() async {
    Get.to(HomeView());
  }

  void changeTheme() async {
    _themeService.selectThemeAtIndex(1);
  }
}
