import 'package:flutter/cupertino.dart';
class TextWidget {
  static Widget getText(String text, String fontF, double n) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontF,
        fontSize: n,
      ),
    );
  }
}