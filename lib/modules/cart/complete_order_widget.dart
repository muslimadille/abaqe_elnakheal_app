import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/modules/cart/success_screen.dart';
import 'package:abaqe_elnakheal_app/modules/login_screen/login_screen.dart';
import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/res.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_botton.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_text_files.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../main_tabs_screen/main_tabs_screen.dart';

class CompleteOrderWidget extends StatefulWidget {
  const CompleteOrderWidget({Key? key}) : super(key: key);

  @override
  _CompleteOrderWidgetState createState() => _CompleteOrderWidgetState();
}

class _CompleteOrderWidgetState extends State<CompleteOrderWidget> {
  final _loginFormGlobalKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(left: D.default_40,right: D.default_40),
      width: double.infinity,
      child: Column(children: [
        Expanded(child: SingleChildScrollView(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image(),
            Center(child: Text("استكمال البيانات",style: S.h1(color: C.GREY_1),),),
            Center(child: Text("برجاء استكمال البيانات الاتية لاتمام تنفيذ الطلب",style: S.h3(color: C.GREY_3),),),
            SizedBox(height: D.default_20,),
            _loginForm(),

            SizedBox(height: D.default_40,),
            _DoneButton(),
            SizedBox(height: D.default_60,)
          ],),))
      ],),);
  }
  Widget _image(){
    return Center(child: Lottie.asset(
        "assets/lottie/upload-files_img.json",
        width: D.default_160,
        height:D.default_160,
        alignment: Alignment.center
    ));
  }
  Widget _DoneButton(){
    return BaseButton(
      onItemClickListener: (){
        Navigator.pop(context);
        MyUtils.navigate(context, SuccessScreen());
      },
      title:"المتابعة",
      color: C.BLUE_1,
      textStyle: S.h3(color: Colors.white),
      margin: EdgeInsets.all(D.default_5),
    );
  }
  Widget _loginForm(){
    return Container(child:
    Form(
      key: _loginFormGlobalKey,
      child: Column(
        children: [
          BaseTextFiled(
            controller: _emailController,
            hint:"رقم بطاقة الهوية",
          ),
         Container(
           width: double.infinity,
           child:  Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container(
               margin: EdgeInsets.only(bottom: D.default_10,top: D.default_10),
               child: Text("ارفاق مستند تقرير احتياج النترات",style: S.h4(color: C.GREY_1),),),
             Container(
               height: D.default_40,
               width: D.default_120,
               decoration: BoxDecoration(
                   color: C.GREY_4,
                   borderRadius: BorderRadius.circular(D.default_10),
                   border: Border.all(color: C.GREY_4,width: D.default_1)
               ),
               child: Center(child: Text("إرفاق",style: S.h3(color: C.GREY_1),),),

             )
           ],),),
          SizedBox(height: D.default_10,),
          Container(
            width: double.infinity,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: D.default_10,top: D.default_10),
                  child: Text("ارفاق صورة من الهوية او سجل المزرعه التجاري",style: S.h4(color: C.GREY_1),),),
                Container(
                  height: D.default_40,
                  width: D.default_120,
                  decoration: BoxDecoration(
                      color: C.GREY_4,
                      borderRadius: BorderRadius.circular(D.default_10),
                      border: Border.all(color: C.GREY_4,width: D.default_1)
                  ),
                  child: Center(child: Text("إرفاق",style: S.h3(color: C.GREY_1),),),

                )
              ],),)
        ],
      ),
    ),);
  }
}
