import 'package:abaqe_elnakheal_app/utils/widgets/loading_widget.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../dio/models/product_model.dart';
import '../../../providers/rate_rovider.dart';
import '../../../utils/baseDimentions.dart';
import '../../../utils/base_text_style.dart';
import '../../../utils/my_colors.dart';

class ProductRatesScreen extends StatefulWidget {
  ProductModel productModel;
   ProductRatesScreen(this.productModel,{Key? key}) : super(key: key);

  @override
  State<ProductRatesScreen> createState() => _ProductRatesScreenState();
}

class _ProductRatesScreenState extends State<ProductRatesScreen> {
  RatesProvider?ratesProvider;
  @override
  void initState() {
    super.initState();
    ratesProvider=Provider.of<RatesProvider>(context,listen: false);
    ratesProvider!.getProductRates(widget.productModel.id!);
  }

  @override
  Widget build(BuildContext context) {
    ratesProvider=Provider.of<RatesProvider>(context,listen: true);
    return ratesProvider!.isLoading?LoadingProgress():Container(
      padding: EdgeInsets.all(D.default_20),
      child: Column(children: [
        _header(),
        Expanded(child: _ratesList(),)
      ],),
    );
  }

  Widget _header(){
    return Container(child: Column(children: [
      Text(widget.productModel.rateCount!.toString(),style: S.h1(color: C.GREY_3),),
      RatingBarIndicator(
        rating: widget.productModel.rateCount!.toDouble(),
        itemBuilder: (context, index) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        itemCount: 5,
        itemSize: D.default_40,
        direction: Axis.horizontal,
        unratedColor: C.GREY_4,
      ),
      SizedBox(width: D.default_10,),
      Text("${ratesProvider!.productRatesModel!.data!.length}${tr("rates")}",style: S.h3(color: Colors.amber,))
    ],),);
  }

  Widget _ratesList(){
    return ListView.separated(itemBuilder: (context,index){
      return _listItem(index);
    }, separatorBuilder: (BuildContext context, int index) {
      return Container(height: D.default_1,color: C.GREY_4,width: double.infinity,);
    }, itemCount:ratesProvider!.productRatesModel!.data!.length ,);
  }

  Widget _listItem(int index){
    return Container(
      margin: EdgeInsets.all(D.default_10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        TransitionImage(
          ratesProvider!.productRatesModel!.data![index].photo!,
          width: D.default_50,
          height: D.default_50,
          radius: D.default_100,
          fit: BoxFit.cover,
        ),
          SizedBox(width: D.default_10,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Expanded(flex:0,child: Text("${ratesProvider!.productRatesModel!.data![index].username!} ${ratesProvider!.productRatesModel!.data![index].lastName!}",style: S.h3(color: C.GREY_1,))),
              Expanded(flex:0,child: RatingBarIndicator(
                rating: ratesProvider!.productRatesModel!.data![index].rate!.toDouble(),
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: D.default_20,
                direction: Axis.horizontal,
                unratedColor: C.GREY_4,
              ),),
              Expanded(
                flex: 0,
                child: Text("${ratesProvider!.productRatesModel!.data![index].updatedAt!}",style: S.h4(color: C.GREY_3,),
                    softWrap:false,overflow: TextOverflow.ellipsis,),
              ),

            ],),
          )
      ],),
    );
  }
}
