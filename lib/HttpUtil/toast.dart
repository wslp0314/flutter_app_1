import 'package:flutter/material.dart';
// import 'package:news_app/util/global.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static void show (
      String msg,
      {
        String position = 'bottom',
      }
      ) {
    var gravity;
    switch (position) {
      case 'bottom':
        gravity = ToastGravity.BOTTOM;
        break;
      case 'center':
        gravity = ToastGravity.CENTER;
        break;
    }
    Fluttertoast.showToast(
      msg: msg,
      // toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      textColor: Color(0xFF000000),
      // fontSize: 16.0
    );
  }
}