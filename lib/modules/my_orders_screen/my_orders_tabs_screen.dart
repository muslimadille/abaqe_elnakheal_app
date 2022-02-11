import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets/tabs_widget.dart';
import '../home/items/card_icon.dart';
import '../login_screen/item/back_btn_widget.dart';
import 'my_orders_screen.dart';
import 'my_previous_orders_screen.dart';

class MyOrdersTabsScreen extends StatefulWidget {
  const MyOrdersTabsScreen({Key? key}) : super(key: key);

  @override
  _MyOrdersTabsScreenState createState() => _MyOrdersTabsScreenState();
}

class _MyOrdersTabsScreenState extends State<MyOrdersTabsScreen> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BaseScreen(body:SafeArea(child: Column(children: [
      _header(),
      Expanded(child: TabsPagesWidget(
        pages: pages,
        tabsTexts: tabsTexts,
      ))
    ],),));
  }
  List<Widget>pages=[
    MyOrdersScreen(),
    MyPreviousOrdersScreen()
  ];
  List<String> tabsTexts=[
    "الطلبات الجارية",
    "الطلبت السابقة"
  ];
  Widget _header(){
    return Container(
      margin: EdgeInsets.all(D.default_30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Expanded(child: Text(tr("my_orders"),style: S.h1(color: C.GREY_1),),),
            CardIconWidget(),
          ],),
          Text(tr("my_orders_subtitle"),style: S.h3(color: C.GREY_3),),
        ],),
    );
  }


}
