
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'baseDimentions.dart';
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
  ///========================bottom sheet================================================
  static void showBottomSheet(BuildContext context,Widget body,double height){
    showMaterialModalBottomSheet(
      context: context,
        backgroundColor:Colors.transparent,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(D.default_20),topRight:Radius.circular(D.default_20)),
              color: Colors.white,
          ),
          child: body,

        ),
      ),
    );
  }

}