import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/modules/home/items/card_icon.dart';
import 'package:abaqe_elnakheal_app/modules/login_screen/item/back_btn_widget.dart';
import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:flutter/material.dart';

import '../home/items/home_search_widget.dart';
import 'items/products_list_widget.dart';

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(body: SafeArea(child:
    Container(
      child: Column(children:  [
        _header(context),
        _search(),
        SizedBox(height: D.default_10,),
        const Expanded(child: ProductsListWidget(),)
      ],),
    ),));
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
          Expanded(child: Text("بذور",style: S.h1(color: C.GREY_1),textAlign: TextAlign.center,)),
          CardIconWidget(),

        ],),);

  }
  Widget _search(){
    return Container(
      margin: EdgeInsets.only(left:D.default_30,right: D.default_30),
      child: HomeSearchWidget(),
    );

  }
}
