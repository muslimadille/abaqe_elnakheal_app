import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:flutter/material.dart';

class BackBottonWidget extends StatelessWidget {
  BuildContext ctx;
  Color? color;
   BackBottonWidget(this.ctx,{this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed:(){
      Navigator.of(ctx).pop();
    }, icon: Icon(Icons.arrow_back_ios,color: color??C.GREY_1,size: D.default_30,));
  }
}
