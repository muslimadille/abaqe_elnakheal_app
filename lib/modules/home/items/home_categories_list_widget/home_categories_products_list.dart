import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'home_products_list_item.dart';

class HomeCategoriesListItem extends StatelessWidget {
   HomeCategoriesListItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: D.default_10),
      width: MediaQuery.of(context).size.width,
      height: D.default_300*0.9,
      child: Column(children: [
        Container(
          child: Row(children: [
          _title(),
          Expanded(child: Container()),
          _seeAll()
        ],),),
        Expanded(child: ListView.builder(
            itemBuilder: (context,index){
          return HomeProductsListItem();
        },
          itemCount: 3,
          scrollDirection: Axis.horizontal,
        ),)
      ],),
    );
  }
  Widget _title(){
    return Container(
      margin: EdgeInsets.only(left: D.default_20,right: D.default_20),
      child: Text("سماد طبيعي",style: S.h3(color: C.GREY_1),),
    );
  }
  Widget _seeAll(){
    return Container(
      margin: EdgeInsets.only(left: D.default_20,right: D.default_20),
      child:Text( tr("more"),style: S.h3(color: C.BLUE_1,underline: true),),
    );
  }
}
