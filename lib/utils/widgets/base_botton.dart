import 'package:abaqe_elnakheal_app/main.dart';
import 'package:flutter/material.dart';
import '../baseDimentions.dart';
import '../base_text_style.dart';
import '../my_colors.dart';

class BaseButton extends StatelessWidget {
  Color? color;
  bool enableShadow;
  EdgeInsets? padding;
  EdgeInsets? margin;
  String title;
  double? width;
  double? height;
  TextStyle? textStyle;
  OnItemClickListener onItemClickListener;
   BaseButton({
     required this.onItemClickListener,
     required this.title,
     this.height,
     this.width,
     this.color,
     this.textStyle,
     this.margin,
     this.padding,
     this.enableShadow=true});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width??double.infinity,
        height: height??D.default_50,
        margin: margin??EdgeInsets.only(top:D.default_10,bottom: D.default_10),
        padding: padding??EdgeInsets.all(D.default_5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(D.default_10),
            color: color??C.BLUE_1,
            boxShadow:enableShadow? [BoxShadow(
                color: C.GREY_4,
                offset:Offset(1,1),
                blurRadius:4,
                spreadRadius: 2
            )]:null
        ),
      child: InkWell(
        onTapCancel: onItemClickListener,
        child: Center(child: Text(title,textAlign: TextAlign.center,style: textStyle??S.h4(color:Colors.white),),),),
    );
  }
}
