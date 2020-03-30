



import 'dart:ui';

class maincolors{


  Color maincolor = HexColor("250f30");
  Color sec_color = HexColor("dd515d");
  Color facebook = HexColor("1778F2");
  Color twetter = HexColor("55ACEE");




}


class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}