import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/baseDimentions.dart';
import '../../utils/widgets/no_data_widget.dart';
import 'order_list_item.dart';

class MyPreviousOrdersScreen extends StatefulWidget {
  const MyPreviousOrdersScreen({Key? key}) : super(key: key);

  @override
  _MyPreviousOrdersScreenState createState() => _MyPreviousOrdersScreenState();
}

class _MyPreviousOrdersScreenState extends State<MyPreviousOrdersScreen> {
  bool _showList=false;
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        body: InkWell(
          onTap: (){
            setState(() {
              _showList=true;
            });
          },
          child: _showList?_myOrdersList():NoDataWidget(image:"assets/lottie/dron.json",title:tr("no_prev_orders"),subTitle:tr("start_order_now")),
        ));
  }
  Widget _myOrdersList(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView.separated(
          itemBuilder: (context,index){
            return OrderListItem();
          },
          separatorBuilder: (context,index){
            return Container(
              height: D.default_10,
            );
          }, itemCount: 3),);
  }
}
