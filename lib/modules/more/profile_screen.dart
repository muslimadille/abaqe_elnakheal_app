import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets/transition_image.dart';
import '../home/items/card_icon.dart';
import '../login_screen/item/back_btn_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(body: SafeArea(child: Column(children: [
      _header(context),
      _devider(),
      _userImage(),
      _devider(),
      _userName(),
      _devider(),
      _userPhone(),
      _devider(),
      _userId(),
      _devider(),
      _userCovernat(),
      _devider(),
      _userCity()
    ],),));
  }
  Widget _header(BuildContext ctx){
    return Container(
      height: D.default_100,
      padding: EdgeInsets.all(D.default_30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BackBottonWidget(ctx),
          Expanded(child: Text("الملف الشخصي",style: S.h1(color: C.GREY_1),textAlign: TextAlign.center,)),
          CardIconWidget(),

        ],),);

  }
  Widget _userName(){
    return Container(
      padding: EdgeInsets.all(D.default_20),
      margin: EdgeInsets.only(left: D.default_10,right: D.default_10),
      child:
      Row(children: [
        Container(
            width: D.default_120,
            child: Text("الاسم",style: S.h4(color: C.GREY_2),)),
        Expanded(child: Text("عبد السلام محمد احمد",style: S.h4(color: C.GREY_2),)),
        Text("تعديل",style: S.h4(color: C.BLUE_1),),
      ],)
      ,);
  }
  Widget _userPhone(){
    return Container(
      padding: EdgeInsets.all(D.default_20),
      margin: EdgeInsets.only(left: D.default_10,right: D.default_10),
      child:
      Row(children: [
        Container(
            width: D.default_120,
            child: Text("رقم التليفون",style: S.h4(color: C.GREY_2),)),
        Expanded(child: Text("+20 1056749852",style: S.h4(color: C.GREY_2),)),
        Text("تعديل",style: S.h4(color: C.BLUE_1),),
      ],)
      ,);
  }
  Widget _userId(){
    return Container(
      padding: EdgeInsets.all(D.default_20),
      margin: EdgeInsets.only(left: D.default_10,right: D.default_10),
      child:
      Row(children: [
        Container(
            width: D.default_120,
            child: Text("رقم الهوية",style: S.h4(color: C.GREY_2),)),
        Expanded(child: Text("26547412139856",style: S.h4(color: C.GREY_2),)),
        Text("تعديل",style: S.h4(color: C.BLUE_1),),
      ],)
      ,);
  }
  Widget _userCovernat(){
    return Container(
      padding: EdgeInsets.all(D.default_20),
      margin: EdgeInsets.only(left: D.default_10,right: D.default_10),
      child:
      Row(children: [
        Container(
            width: D.default_120,
            child: Text("المحافظة",style: S.h4(color: C.GREY_2),)),
        Expanded(child: Text("القاهرة",style: S.h4(color: C.GREY_2),)),
        Text("تعديل",style: S.h4(color: C.BLUE_1),),
      ],)
      ,);
  }
  Widget _userCity(){
    return Container(
      padding: EdgeInsets.all(D.default_20),
      margin: EdgeInsets.only(left: D.default_10,right: D.default_10),
      child:
      Row(children: [
        Container(
          width: D.default_120,
            child: Text("الحي",style: S.h4(color: C.GREY_2),)),
        Expanded(child: Text("مدينة نصر",style: S.h4(color: C.GREY_2),)),
        Text("تعديل",style: S.h4(color: C.BLUE_1),),
      ],)
      ,);
  }

  Widget _userImage(){
    return Container(
      margin: EdgeInsets.all(D.default_20),
      child: Row(children: [
        TransitionImage("assets/images/avatar_img.png",
          height: D.default_60,
          width: D.default_60,
          fit: BoxFit.cover,
        ),


      ],),);
  }

  Widget _devider(){
    return Container(height: D.default_1,color: C.GREY_5,width: double.infinity,);
  }

}
