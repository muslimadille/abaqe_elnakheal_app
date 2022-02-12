import 'package:abaqe_elnakheal_app/utils/widgets/base_botton.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/baseDimentions.dart';
import '../../../utils/base_text_style.dart';
import '../../../utils/my_colors.dart';

class RatesOrderScreen extends StatelessWidget {
   RatesOrderScreen({Key? key}) : super(key: key);
  TextEditingController _notesController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(D.default_20),
      child: Column(children: [
        _header(),
        Container(
          margin: EdgeInsets.only(left: D.default_10,right: D.default_10),
          width:double.infinity,child: Text("المنتجات",style: S.h2(color: C.GREY_2,),textAlign: TextAlign.start,),),
        Expanded(child: _ratesList(),),
        _nots(),
        BaseButton(onItemClickListener: (){
          Navigator.pop(context);
        }, title: "تقييم الطلب",textStyle: S.h3(color: Colors.white),)
      ],),
    );
  }
  Widget _header(){
    return Container(child: Column(children: [
      Text("تقييم الطلب",style: S.h1(color: C.GREY_2),),
      Center(child: Lottie.asset(
          "assets/lottie/stars_lottie.json",
          width: double.infinity,
          height: D.default_80,
          alignment: Alignment.center
      )),
      SizedBox(width: D.default_10,),

    ],),);
  }
  Widget _ratesList(){
    return ListView.separated(itemBuilder: (context,index){
      return _listItem();
    }, separatorBuilder: (BuildContext context, int index) {
      return Container(height: D.default_1,color: C.GREY_4,width: double.infinity,);
    }, itemCount: 2,);
  }
  Widget _listItem(){
    return Container(
      margin: EdgeInsets.all(D.default_10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TransitionImage(
            "assets/images/rice_img.png",
            width: D.default_70,
            height: D.default_70,
            fit: BoxFit.cover,
          ),
          SizedBox(width: D.default_10,),
          Expanded(flex:1,child: Text("سماد طبيعي للتزهير والانبات بتركيز",style: S.h3(color: C.GREY_1,))),
          RatingBar.builder(
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: D.default_25,
            direction: Axis.horizontal,
            unratedColor: C.GREY_4,
            onRatingUpdate: (double value) {  },
          )
        ],),
    );
  }
  Widget _nots(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: D.default_10,top: D.default_20),
          child: Text("أضف تعليقك",style: S.h3(color: C.GREY_1),),),
        Container(
          height: D.default_80,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(D.default_10),
              border: Border.all(color: C.GREY_4,width: D.default_1)
          ),
          child: TextFormField(
            controller: _notesController,
            style: S.h3(color: C.GREY_1),
            decoration: InputDecoration(
              hintText: "اكتب هنا...",
              hintStyle: S.h4(color: C.GREY_4),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              border:InputBorder.none,
              errorStyle: S.h4(color: Colors.red),
              contentPadding: EdgeInsets.fromLTRB(D.default_10,D.default_10, D.default_10, D.default_10),

            ),
            keyboardType: TextInputType.text,
            cursorColor: C.GREY_3,
            autofocus: false,
          ),

        )
      ],);
  }

}
