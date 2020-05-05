import 'package:flutter/cupertino.dart';

class ColorTable {
  static final backgroundColor = fromHex('F4F7FC');
  static final white90 = Color.fromRGBO(255, 255, 255, 0.90);

  // Ex use: ColorTable.fromHex('#ff0000') | ColorTable.fromHex('ff0000')
  static Color fromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

}