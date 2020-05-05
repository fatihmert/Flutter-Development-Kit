// Device responsive calculation funtions
// orientation etc..

// Pattern -> Singleton

import 'package:flutter/cupertino.dart';
import '../app/enums.dart';


class Responsive{
  Responsive._privateConstructor();

  static final Responsive _instance = Responsive._privateConstructor();

  static Responsive get instance => _instance;

  double findPercent(
      double value,
      ResponsiveSize sizeType,
      BuildContext context
  ){
    double getFullSize;

    if (sizeType == ResponsiveSize.WIDTH){
      getFullSize = MediaQuery.of(context).size.width;
    } else if(sizeType == ResponsiveSize.HEIGHT){
      getFullSize = MediaQuery.of(context).size.height;
    }

    return value * 100 / getFullSize;
  }

  double getPercent(
      double percent,
      ResponsiveSize sizeType,
      BuildContext context
  ){
    if (sizeType == ResponsiveSize.WIDTH){
      return MediaQuery.of(context).size.width * percent / 100;
    } else if(sizeType == ResponsiveSize.HEIGHT){
      return MediaQuery.of(context).size.height * percent / 100;
    }
  }


}

/*
https://medium.com/flutter-community/flutter-effectively-scale-ui-according-to-different-screen-sizes-2cb7c115ea0a
class SizeConfig {
  SizeConfig._privateConstructor();

  static final SizeConfig _instance = SizeConfig._privateConstructor();

  static SizeConfig get instance => _instance;

  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}*/
