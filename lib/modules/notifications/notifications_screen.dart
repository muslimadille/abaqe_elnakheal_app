import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets/transition_image.dart';
import '../home/items/card_icon.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(body: SafeArea(child: Column(children: [
      _header(),
      Expanded(child: Container(
        margin: EdgeInsets.only(top: D.default_20,bottom: D.default_20),
        child: _notificationsList(),))
    ],),));
  }
  Widget _header(){
    return Container(
      margin: EdgeInsets.all(D.default_30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Expanded(child: Text(tr("notifications"),style: S.h1(color: C.GREY_1),),),
            CardIconWidget(),
          ],),
          Text(tr("notifications_subtitle"),style: S.h3(color: C.GREY_3),),
        ],),
    );
  }
  Widget _notificationsList(){
    return ListView.separated(itemBuilder: (context,index){
      return _listItem();
    }, separatorBuilder: (context,index){
      return  Container(height: D.default_1,color: C.GREY_5,);
    }, itemCount: 4);
  }
Widget _listItem(){
    return Container(
      margin: EdgeInsets.only(top:D.default_20,bottom: D.default_20,left: D.default_20,right: D.default_20),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TransitionImage(
          "assets/images/setting_ic.png",
          width: D.default_50,
          height: D.default_50,
          fit:BoxFit.cover,
        ),
        Expanded(child: Container(
          margin: EdgeInsets.only(left: D.default_10,right: D.default_10,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("فريق عبق النخيل",style: S.h3(color: C.GREY_2),),
                Text("اليوم 2:30م",style: S.h5(color: C.GREY_3),),
              ],),
              Text("لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي",style: S.h4(color: C.GREY_4),)

            ],),)),
      ],),);
}
}
