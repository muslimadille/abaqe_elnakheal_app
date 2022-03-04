import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:flutter/material.dart';

import '../../../../dio/models/home_model.dart';
import 'home_categories_products_list.dart';

class HomeCategoriesListWidget extends StatelessWidget {
  HomeModel homeData;

   HomeCategoriesListWidget(this.homeData, {Key? key}) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: homeData.categories!.length*D.default_300,
      padding: EdgeInsets.all(D.default_10),
      child: ListView.builder(
          itemBuilder: (context, index) {
            return HomeCategoriesListItem(homeData.categories![index]);
          },
          itemCount: homeData.categories!.length,
          physics: const NeverScrollableScrollPhysics()),
    );
  }
}
