// Facade Design Pattern

import 'package:flutter/material.dart';
// import 'package:get/get.dart';

import '../helpers/responsive.dart';
//cmt::IMPORT_NEW_HELPER -> DON'T REMOVE THIS

class Helper {
  /*
  * Helper.responsive.findPercent(50, ResponsiveSize.WIDTH, context);
  * */
  static Responsive get responsive => Responsive.instance;

  /*void changeTheme(ThemeData themeData) {
    Get.changeTheme(themeData);
  }*/

//cmt::ADD_NEW_HELPER -> DON'T REMOVE THIS
}
