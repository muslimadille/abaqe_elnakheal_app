import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:flutter/material.dart';

import 'home_categories_products_list.dart';

class HomeCategoriesListWidget extends StatelessWidget {
  const HomeCategoriesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3*D.default_300,
      padding: EdgeInsets.all(D.default_10),
      child: ListView.builder(
          itemBuilder: (context, index) {
            return HomeCategoriesListItem();
          },
          itemCount: 3,
          physics: const NeverScrollableScrollPhysics()),
    );
  }
}
