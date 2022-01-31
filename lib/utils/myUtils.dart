
import 'package:flutter/material.dart';
class MyUtils{

  /// ........... navigation utils................................
  static void navigate(BuildContext context,Widget screen){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }
  static void navigateAsFirstScreen(BuildContext context,Widget screen){
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => screen));
  }

  static void navigateReplaceCurrent(BuildContext context,Widget screen){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => screen));
  }
  ///========================intor utils===================================================
  static void printLongLine(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

}