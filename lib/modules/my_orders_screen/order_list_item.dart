import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../dio/models/my_orders_model.dart';
import '../../utils/baseDimentions.dart';
import 'my_order_details_screen.dart';
import 'order_traking_screen.dart';

class OrderListItem extends StatelessWidget {
  OrderData order;
   OrderListItem(this.order,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          MyUtils.navigate(context,  OrderTrakingScreen(order));
        },
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TransitionImage(
            order.cartItems![0].photo!,
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
                Text("${tr("order_num")}:${order.id}",style: S.h4(color: C.GREY_3),),
                Text("${order.createdAt}",style: S.h5(color: C.GREY_4),)

              ],),)),
          Container(child:Column(children: [
            Text("${order.finalPrice}${tr("currency")}",style: S.h4(color: C.BLUE_1),),
            Container(
              padding: EdgeInsets.only(top:D.default_5,bottom: D.default_5,left:D.default_10,right:D.default_10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(D.default_5)),
                color: C.BLUE_2.withOpacity(0.5),
              ),
              child: Text(order.statusText!.name!,style: S.h5(color: C.BLUE_1),),
            )

          ],) ),
        ],),),
    );
  }

}
