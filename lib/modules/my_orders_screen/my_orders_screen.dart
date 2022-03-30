import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../providers/my_orders_provider.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/widgets/loading_widget.dart';
import '../../utils/widgets/no_data_widget.dart';
import 'order_list_item.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  MyordersProvider? myordersProvider;
  @override
  void initState() {
    super.initState();
    myordersProvider=Provider.of<MyordersProvider>(context,listen: false);
    myordersProvider!.getMyOrders();
  }
  @override
  Widget build(BuildContext context) {
    myordersProvider=Provider.of<MyordersProvider>(context,listen: true);
    return BaseScreen(
        body: InkWell(
          onTap: (){
            setState(() {
            });
          },
      child: myordersProvider!.isLoading?LoadingProgress():myordersProvider!.currentOrdersList!.isNotEmpty?_myOrdersList():NoDataWidget(image:"assets/lottie/dron.json",title:tr("no_current_orders"),subTitle:tr("start_order")),
    ));
  }
  Widget _myOrdersList(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView.separated(
        itemBuilder: (context,index){
          return OrderListItem(myordersProvider!.currentOrdersList![index]);
        },
        separatorBuilder: (context,index){
          return Container(
            height: D.default_10,
          );
        }, itemCount: myordersProvider!.currentOrdersList!.length),);
  }
}
