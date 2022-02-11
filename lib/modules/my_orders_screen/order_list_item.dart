import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/baseDimentions.dart';
import 'my_order_details_screen.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          MyUtils.navigate(context, MyOrderDetails());
        },
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TransitionImage(
            "assets/images/rice_img.png",
            width: D.default_70,
            height: D.default_70,
            radius: D.default_5,
            fit:BoxFit.cover,
            padding: EdgeInsets.only(left: D.default_10,right: D.default_10),
          ),
          Expanded(child: Container(
            margin: EdgeInsets.only(left: D.default_10,right: D.default_10,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("رقم الطلب:3451:123",style: S.h4(color: C.GREY_3),),
                Text("8أكتوبر 2022 11:57 م",style: S.h5(color: C.GREY_4),)

              ],),)),
          Container(child:Column(children: [
            Text("135.5جم",style: S.h4(color: C.BLUE_1),),
            Container(
              padding: EdgeInsets.only(top:D.default_5,bottom: D.default_5,left:D.default_10,right:D.default_10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(D.default_20)),
                color: Colors.blue.withOpacity(0.5),
              ),
              child: Text("قيد التوصيل",style: S.h5(color: C.BLUE_1),),
            )

          ],) ),
        ],),),
    );
  }

}
