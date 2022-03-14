import 'package:abaqe_elnakheal_app/modules/products_screen/items/product_list_item.dart';
import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:flutter/cupertino.dart';

import '../../../dio/models/product_model.dart';
import '../product_details_screen.dart';

class ProductsListWidget extends StatelessWidget {
  List<ProductModel>? data;
   ProductsListWidget(this.data,{Key? key}) : super(key: key);

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
                    GlobalKey key=GlobalKey();
                return ProductsListItem(
                    data![index],
                    index,(){
                      MyUtils.navigate(context, ProductDetailsScreen(data![index]));
                },key);
              },
              childCount: data!.length,
              semanticIndexOffset: 1,
            )),

      ]),);
  }
}
