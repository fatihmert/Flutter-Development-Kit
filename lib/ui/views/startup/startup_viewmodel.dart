import 'package:flutter/material.dart';
import 'package:flutterarch/app/locator.dart';
import 'package:flutterarch/ui/views/home/home_view.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class StartupViewModel extends BaseViewModel{
  void navigateToHome() async{
    Get.to(HomeView());
  }
}