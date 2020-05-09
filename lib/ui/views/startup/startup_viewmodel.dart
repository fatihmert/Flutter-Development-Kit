import 'package:flutter/material.dart';
import '../../../app/locator.dart';
import '../home/home_view.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class StartupViewModel extends BaseViewModel{
  void navigateToHome() async{
    Get.to(HomeView());
  }
}