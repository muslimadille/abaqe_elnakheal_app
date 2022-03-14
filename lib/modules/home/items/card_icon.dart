import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/res.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';
import '../../../utils/constants.dart';
import '../../cart/my_cart_screen.dart';
import '../../login_screen/login_screen.dart';

class CardIconWidget extends StatelessWidget {
  bool isDarkBG;
  CartProvider? cartProvider;

   CardIconWidget({this.isDarkBG=false});

  @override
  Widget build(BuildContext context) {
    cartProvider=Provider.of<CartProvider>(context,listen: true);
    return InkWell(
      onTap: (){
        if(Constants.currentUser==null){
          MyUtils.navigateReplaceCurrent(Constants.tabScreenContext!, LoginScreen());
        }else{
          MyUtils.navigate(context, MyCartScreen());
        }
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
                  "${cartProvider!.myCartModel!=null?cartProvider!.myCartModel!.items!.length:0}",
                  style: S.h6(color: isDarkBG?C.BLUE_1:Colors.white),
                ),
              ),
            ),right: -D.default_5,top:-D.default_5 ,)
        ],
      ),
    ),);
  }
}
