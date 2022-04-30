import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/loading_widget.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/no_data_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/notifications_provider.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets/transition_image.dart';
import '../home/items/card_icon.dart';
import '../my_orders_screen/order_traking_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  NotificationsProvider?notificationsProvider;
  @override
  void initState() {
    super.initState();
    notificationsProvider=Provider.of<NotificationsProvider>(context,listen: false);
    notificationsProvider!.getNotifications();
  }
  @override
  Widget build(BuildContext context) {
    notificationsProvider=Provider.of<NotificationsProvider>(context,listen: true);
    return BaseScreen(body: SafeArea(child: Column(children: [
      _header(),
      Expanded(child: Container(
        margin: EdgeInsets.only(top: D.default_20,bottom: D.default_20),
        child: notificationsProvider!.isLoading?LoadingProgress():_notificationsList(),))
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
    return notificationsProvider!.notificationModel!=null?ListView.separated(itemBuilder: (context,index){
      return _listItem(index);
    }, separatorBuilder: (context,index){
      return  Container(height: D.default_1,color: C.GREY_5,);
    }, itemCount: notificationsProvider!.notificationModel!.data!.length):notificationsProvider!.notificationModel!.data!.isNotEmpty?
    ListView.separated(itemBuilder: (context,index){
      return _listItem(index);
    }, separatorBuilder: (context,index){
      return  Container(height: D.default_1,color: C.GREY_5,);
    }, itemCount: 4)
        :NoDataWidget(
      image: "assets/lottie/shopping_error_bg.json",
      title: tr("no_notifications"),
      subTitle: tr(""),
      height: D.default_150,
      width: D.default_150,
    );
  }
Widget _listItem(int index){
    return Container(
      margin: EdgeInsets.only(top:D.default_20,bottom: D.default_20,left: D.default_20,right: D.default_20),
      child: InkWell(
        onTap: (){
          MyUtils.navigate(context, OrderTrakingScreen(notificationsProvider!.notificationModel!.data![index].order!));
        },
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
                    Text(notificationsProvider!.notificationModel!.data![0].getSender!.username!,style: S.h3(color: C.GREY_2),),
                    Text(notificationsProvider!.notificationModel!.data![0].createdAt!,style: S.h5(color: C.GREY_3),),
                  ],),
                Text(notificationsProvider!.notificationModel!.data![0].message!,style: S.h4(color: C.GREY_4),)

              ],),)),
        ],),),);
}
}
