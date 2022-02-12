import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_botton.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/baseDimentions.dart';
import '../../utils/myUtils.dart';
import '../../utils/my_colors.dart';
import '../../utils/res.dart';
import '../../utils/widgets/transition_image.dart';
import '../home/home_screen.dart';
import '../main_tabs_screen/main_tabs_screen.dart';
import '../my_orders_screen/order_traking_screen.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(body: Stack(
      alignment:AlignmentDirectional.center,
      children: [
        TransitionImage(Res.SPLASH_BG,fit: BoxFit.cover,
          width: double.infinity,height: double.infinity,),
        Container(
          margin: EdgeInsets.all(D.default_60),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Center(child: Lottie.asset(
                "assets/lottie/success_lottie.json",
                width: D.default_160,
                height:D.default_160,
                alignment: Alignment.center
            )),
              Container(
                margin: EdgeInsets.all(D.default_10),
                child: Text("تم ارسال طلبك للبائع بنجاح",style: S.h2(color: Colors.white),),),
              Container(
                margin: EdgeInsets.all(D.default_10),
                child: Text("يمكنك متابعة حالة طلبك من قائمة الطلبات الخاصة بك",style: S.h4(color: Colors.white),textAlign: TextAlign.center,),),
              BaseButton(onItemClickListener: (){
                MyUtils.navigate(context, const OrderTrakingScreen());
              }, title: "متابعة الطلب",color: Colors.white
                ,textStyle: S.h2(color:C.BLUE_1),
                enableShadow: false,
                height: D.default_50,),
              SizedBox(height: D.default_10,),
              InkWell(
                onTap: (){
                  MyUtils.navigateAsFirstScreen(context, HomeScreen());
                },
                  child: Text("العوده للصفحة الرئيسية",style: S.h2(color: Colors.white),textAlign: TextAlign.center,))
          ],),),


      ],
    ));
  }
}
