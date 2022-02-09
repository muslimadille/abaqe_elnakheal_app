import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../utils/baseDimentions.dart';
import '../../../utils/base_text_style.dart';
import '../../../utils/my_colors.dart';

class ProductRatesScreen extends StatelessWidget {
  const ProductRatesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(D.default_20),
      child: Column(children: [
        _header(),
        Expanded(child: _ratesList(),)
      ],),
    );
  }
  Widget _header(){
    return Container(child: Column(children: [
      Text("4.5",style: S.h1(color: C.GREY_3),),
      RatingBarIndicator(
        rating: 4.50,
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
      Text("(23 تقييم)",style: S.h3(color: Colors.amber,))
    ],),);
  }
  Widget _ratesList(){
    return ListView.separated(itemBuilder: (context,index){
      return _listItem();
    }, separatorBuilder: (BuildContext context, int index) {
      return Container(height: D.default_1,color: C.GREY_4,width: double.infinity,);
    }, itemCount: 5,);
  }
  Widget _listItem(){
    return Container(
      margin: EdgeInsets.all(D.default_10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        TransitionImage(
            "assets/images/banner_demo_img.png",
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
              Expanded(flex:0,child: Text("Mohamed Ashraf",style: S.h3(color: C.GREY_1,))),
              Expanded(flex:0,child: RatingBarIndicator(
                rating: 4.50,
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
                child: Text("لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى .",style: S.h4(color: C.GREY_3,),
                    softWrap:false,overflow: TextOverflow.ellipsis,),
              ),

            ],),
          )
      ],),
    );
  }

}
