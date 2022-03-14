import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../baseDimentions.dart';
import '../base_text_style.dart';
import '../my_colors.dart';

class NoDataWidget extends StatelessWidget {
  String title,subTitle,image;
  double? width,height;

   NoDataWidget({required this.image,required this.title,required this.subTitle,this.width,this.height}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(D.default_20),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Lottie.asset(
            image,
            width: width??D.default_200,
            height: height??D.default_300,
            alignment: Alignment.center
        )),
        SizedBox(height: D.default_20,),
        Text(title,style: S.h1(color: C.GREY_1),textAlign: TextAlign.center,),
        Text(subTitle,style: S.h3(color: C.GREY_4),textAlign: TextAlign.center,),
      ],),);
  }
}
