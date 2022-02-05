import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/modules/home/items/card_icon.dart';
import 'package:abaqe_elnakheal_app/modules/home/items/home_search_widget.dart';
import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'items/categories_list_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BaseScreen(body: Container(
      child: Column(children: [
        _header(),
        Expanded(child: _categoriesList())

      ],),
    )));
  }
  Widget _header(){
    return Container(
      margin: EdgeInsets.all(D.default_30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Expanded(child: Text(tr("products"),style: S.h1(color: C.GREY_1),),),
            CardIconWidget(),
          ],),
          Text(tr("home_title"),style: S.h3(color: C.GREY_3),),
          SizedBox(height: D.default_20,),
          HomeSearchWidget(),
        ],),
    );
  }
  Widget _categoriesList(){
    return Container(
      margin: EdgeInsets.only(left: D.default_30,right: D.default_30),
      child: CustomScrollView(slivers: [
      SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: D.default_10,
            mainAxisSpacing: D.default_10,
            childAspectRatio: D.default_1,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return CategoryListItem(
                  index,(){});
            },
            childCount: 5,
            semanticIndexOffset: 1,
          )),

    ]),);
  }
}
