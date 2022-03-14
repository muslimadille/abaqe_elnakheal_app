import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utils/myUtils.dart';
import '../../products_screen/products_list_screen.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        MyUtils.navigate(context, ProductsListScreen(title:tr("search"),isSearch: true,));
      },
      child: Container(
        padding: EdgeInsets.all(D.default_5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(D.default_20),
          color: C.GREY_5,
        ),
        width: double.infinity,
        child: Row(children: [
          SizedBox(width: D.default_10,),
          Icon(Icons.search,size: D.default_30,color: C.BLUE_1,),
          Container(
            padding: EdgeInsets.all(D.default_10),
            child: Text(tr("search_for_product"),style: S.h3(color: C.GREY_3),),)
        ],),
      ),
    );
  }
}
