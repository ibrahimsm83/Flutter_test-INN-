import 'package:flutter/material.dart';

class ColorManager {
  static Color white = Colors.white;
  static Color red = Colors.red;
  static Color primary = HexColor.fromHex("#E00065");
  static Color darkGrey = HexColor.fromHex("#656565");
  static Color grey = HexColor.fromHex("#737373");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color blue = HexColor.fromHex("#0C2A6E");
 static Color darkblue = HexColor.fromHex("#27B0FF");
  static Color black = HexColor.fromHex("#000000");
  // new colors


}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
