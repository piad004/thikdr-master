import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray5005e = fromHex('#5ea8a8a8');

  static Color limeA200 = fromHex('#faff36');

  static Color red401 = fromHex('#ed4a4f');

  static Color red400 = fromHex('#f74747');

  static Color greenA100 = fromHex('#b8ffba');

  static Color black90000 = fromHex('#00000000');

  static Color deepOrange500 = fromHex('#ff5733');

  static Color gray804 = fromHex('#404040');

  static Color deepOrange100 = fromHex('#fcb0b0');

  static Color gray402 = fromHex('#bdbaba');

  static Color gray5004a = fromHex('#4aa38f8f');

  static Color gray400 = fromHex('#b0b0b0');

  static Color gray401 = fromHex('#c4c4c4');

  static Color gray802 = fromHex('#3d3d3d');

  static Color gray803 = fromHex('#424242');

  static Color gray800 = fromHex('#383838');

  static Color gray801 = fromHex('#4d4d4d');

  static Color lightBlue20075 = fromHex('#756bcff0');

  static Color gray5004f = fromHex('#4fc49c9c');

  static Color bluegray400 = fromHex('#888888');

  static Color blue100 = fromHex('#c4d1ff');

  static Color blue300 = fromHex('#8572ff');

  static Color blue500 = fromHex('#6bcfef');

  static Color cyan50 = fromHex('#d1f5ff');

  static Color gray40040 = fromHex('#40bfbfbf');

  static Color gray51 = fromHex('#fafafa');

  static Color red700 = fromHex('#d13b24');

  static Color lightBlue200 = fromHex('#6bcff0');

  static Color red300 = fromHex('#f27a7a');

  static Color red301 = fromHex('#fa7575');

  static Color gray50 = fromHex('#fcfcfc');

  static Color teal400 = fromHex('#308cab');

  static Color yellow900 = fromHex('#fa8212');

  static Color redA400 = fromHex('#fa1f1f');

  static Color deepOrange400 = fromHex('#fa7347');

  static Color yellow100 = fromHex('#fff5d1');

  static Color orangeA100 = fromHex('#ffd18f');

  static Color gray501 = fromHex('#9c9c9c');

  static Color gray502 = fromHex('#919191');

  static Color gray103 = fromHex('#faf5f5');

  static Color gray500 = fromHex('#a19999');

  static Color gray901 = fromHex('#141414');

  static Color gray505 = fromHex('#ababab');

  static Color gray503 = fromHex('#a3a3a3');

  static Color gray900 = fromHex('#292929');

  static Color gray504 = fromHex('#968f8f');

  static Color gray101 = fromHex('#f5f5f5');

  static Color green50 = fromHex('#dbffde');

  static Color gray102 = fromHex('#f7f7f7');

  static Color gray100 = fromHex('#f2f2f2');

  static Color lightBlue100 = fromHex('#a6e6fa');

  static Color red200 = fromHex('#fc9c9c');

  static Color green901 = fromHex('#057d0a');

  static Color red201 = fromHex('#ff9494');

  static Color green900 = fromHex('#038008');

  static Color lime90075 = fromHex('#75855917');

  static Color red202 = fromHex('#e39982');

  static Color gray5004a1 = fromHex('#4a968c8c');

  static Color green500 = fromHex('#40bf4f');

  static Color amberA701 = fromHex('#fcab0a');

  static Color amberA700 = fromHex('#f5a60d');

  static Color black90040 = fromHex('#40000000');

  static Color deepPurpleA400 = fromHex('#4d30ff');

  static Color redA700 = fromHex('#f50505');

  static Color yellow200 = fromHex('#ffe396');

  static Color yellow500 = fromHex('#f5a60c');

  static Color gray600 = fromHex('#7d7575');

  static Color gray601 = fromHex('#787373');

  static Color gray602 = fromHex('#6e6e6e');

  static Color amber700 = fromHex('#ff9e0a');

  static Color gray200 = fromHex('#ebebeb');

  static Color gray201 = fromHex('#f2eded');

  static Color black90051 = fromHex('#51000000');

  static Color gray70040 = fromHex('#406e6969');

  static Color cyan800 = fromHex('#0a7391');

  static Color redA1002b = fromHex('#2bff8f8f');

  static Color whiteA700 = fromHex('#ffffff');

  static Color deepOrange50 = fromHex('#ffe0db');

  static Color gray400A8 = fromHex('#a8bababa');

  static Color red900 = fromHex('#bd171c');

  static Color deepOrange400De = fromHex('#def58c42');

  static Color red101 = fromHex('#ffdbd1');

  static Color red500 = fromHex('#f74545');

  static Color deepPurple100 = fromHex('#cfc4ff');

  static Color red100 = fromHex('#fadbdb');

  static Color black904 = fromHex('#080808');

  static Color black903 = fromHex('#030303');

  static Color black900 = fromHex('#000000');

  static Color deepOrange601 = fromHex('#fc4f1a');

  static Color deepOrange600 = fromHex('#f55724');

  static Color black902 = fromHex('#050505');

  static Color black901 = fromHex('#0d0d0d');

  static Color deepOrange200 = fromHex('#ffb085');

  static Color deepPurpleA700 = fromHex('#1400fc');

  static Color gray303 = fromHex('#e3e3e3');

  static Color gray700 = fromHex('#6e6969');

  static Color gray301 = fromHex('#e6e6e6');

  static Color gray302 = fromHex('#e0e3e3');

  static Color gray703 = fromHex('#545454');

  static Color lightBlue51 = fromHex('#e8faff');

  static Color gray701 = fromHex('#636363');

  static Color gray702 = fromHex('#666666');

  static Color bluegray100 = fromHex('#d6d6d6');

  static Color lightBlue50 = fromHex('#dbf7ff');

  static Color gray300 = fromHex('#dedbdb');

  static Color bluegray900 = fromHex('#2e2e2e');

  static Color indigo100 = fromHex('#bfbaff');

  static Color bluegray101 = fromHex('#cccccc');

  static Color cyan701 = fromHex('#1c8cb0');

  static Color cyan700 = fromHex('#0385ad');

  static Color bluegray901 = fromHex('#303030');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
