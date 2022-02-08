import 'package:abaqe_elnakheal_app/modules/products_screen/items/product_list_item.dart';
import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:flutter/cupertino.dart';

import '../product_details_screen.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: D.default_20,right: D.default_20),
      child: CustomScrollView(slivers: [
        SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: D.default_10,
              mainAxisSpacing: D.default_10,
              childAspectRatio: D.default_1*0.8,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ProductsListItem(
                    index,(){
                      MyUtils.navigate(context, ProductDetailsScreen());
                });
              },
              childCount: 5,
              semanticIndexOffset: 1,
            )),

      ]),);
  }
}
