import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/baseDimentions.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Center(child: Lottie.asset(
    'assets/lottie/dron.json',
        width: D.default_200,
        height: D.default_300,
        alignment: Alignment.center
    )),
        SizedBox(height: D.default_20,),
        Text("لايوجد طلبات جارية",style: S.h1(color: C.GREY_1),),
        Text("ابدأ بالطلب الآن",style: S.h3(color: C.GREY_4),),


      ],));
  }
}
