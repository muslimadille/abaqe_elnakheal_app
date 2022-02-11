import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/res.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:flutter/material.dart';

import '../../cart/my_cart_screen.dart';

class CardIconWidget extends StatelessWidget {
  bool isDarkBG;

   CardIconWidget({this.isDarkBG=false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        MyUtils.navigate(context, MyCartScreen());
      },
      child: Container(
      child: Stack(
        clipBehavior: Clip.none,
        alignment:AlignmentDirectional.topStart ,
        children: [
          TransitionImage(
            isDarkBG?"assets/images/card_ic_white.png":Res.CARD_IC,
            width: D.default_30,
            height: D.default_30,
          ),
          Positioned(
            child: Container(
              width: D.default_20,
              height: D.default_20,
              padding: EdgeInsets.all(D.default_2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(D.default_100),
                color: isDarkBG?Colors.white:C.BLUE_1,
              ),
              child: Center(
                child: Text(
                  "1",
                  style: S.h6(color: isDarkBG?C.BLUE_1:Colors.white),
                ),
              ),
            ),right: -D.default_5,top:-D.default_5 ,)
        ],
      ),
    ),);
  }
}
