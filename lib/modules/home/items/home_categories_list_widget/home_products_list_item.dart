import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../dio/models/product_model.dart';
import '../../../../utils/myUtils.dart';
import '../../../products_screen/product_details_screen.dart';

class HomeProductsListItem extends StatelessWidget {
  ProductModel productModel;
   HomeProductsListItem(this.productModel) ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){MyUtils.navigate(context, ProductDetailsScreen(productModel));},
      child: Container(
        margin: EdgeInsets.all(D.default_10),
        width: D.default_150,
        height: D.default_200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(D.default_10),
            color: Colors.white,
            boxShadow:[BoxShadow(
                color: C.BLUE_1.withOpacity(0.3),
                offset:Offset(1,1),
                blurRadius:5,
                spreadRadius: 1
            )]
        ),
        child: Stack(
          children: [

            Container(
              margin: EdgeInsets.all(D.default_10),
              child:Column(children: [
                _image(),
                _description(),
                _coast()

              ],),
            ),_discoundWidget(),
          ],
        ),
      ),
    );
  }
  Widget _image(){
    return TransitionImage(
      productModel.photo??"",
      height: D.default_100,
      width: double.infinity,
      fit: BoxFit.cover,
      radius: D.default_10,
    );
  }
  Widget _discoundWidget(){
    return Container(
      height: D.default_30,
      width: D.default_90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(D.default_10),bottomLeft: Radius.circular(D.default_10)),
        color: C.BLUE_1,
      ),
      child: Center(child: Text("${tr("discount")}${productModel.discountPercentage}%",style: S.h5(color: Colors.white),),),
    );
  }
  Widget _description(){
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top:D.default_10),
        child: Text(productModel.title!,style: S.h4(color: C.GREY_3),),),
    );
  }
  Widget _coast(){
    return Container(child:
    Row(children: [
      Text(productModel.offerPrice.toString()??"",style: S.h4(color: C.BLUE_1),),
      Text("/",style: S.h4(color: C.BLUE_1),),
      Text(productModel.price!,style: S.h4(color: C.GREY_3,decoration: TextDecoration.lineThrough),),
      Text(tr("currency"),style: S.h4(color: C.BLUE_1),)
    ],),);
  }
}
