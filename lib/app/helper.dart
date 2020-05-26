// Facade Design Pattern

import '../helpers/responsive.dart';
//cmt::IMPORT_NEW_HELPER -> DON'T REMOVE THIS

class Helper {
  /*
  * Helper.responsive.findPercent(50, ResponsiveSize.WIDTH, context);
  * */
  static Responsive get responsive => Responsive.instance;

//cmt::ADD_NEW_HELPER -> DON'T REMOVE THIS
}