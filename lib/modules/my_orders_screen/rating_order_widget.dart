import 'package:abaqe_elnakheal_app/utils/widgets/base_botton.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../utils/baseDimentions.dart';
import '../../../utils/base_text_style.dart';
import '../../../utils/my_colors.dart';
import '../../dio/models/my_orders_model.dart';
import '../../providers/rate_rovider.dart';
import '../../utils/widgets/loading_widget.dart';

class RatesOrderScreen extends StatefulWidget {
  OrderData order;
   RatesOrderScreen(this.order,{Key? key}) : super(key: key);

  @override
  State<RatesOrderScreen> createState() => _RatesOrderScreenState();
}

class _RatesOrderScreenState extends State<RatesOrderScreen> {
  TextEditingController _notesController=TextEditingController();
  RatesProvider? ratesProvider;
  List<String>ordersRates=[];
  @override
  void initState() {
    super.initState();
    ratesProvider=Provider.of<RatesProvider>(context,listen: false);
    widget.order.cartItems!.forEach((element) {
      ordersRates.add("");

    });
  }

  @override
  Widget build(BuildContext context) {
    ratesProvider=Provider.of<RatesProvider>(context,listen: false);
    return Container(
      padding: EdgeInsets.all(D.default_20),
      child: Stack(
        alignment:AlignmentDirectional.center,
        children: [
        Column(children: [
          _header(),
          Container(
            margin: EdgeInsets.only(left: D.default_10,right: D.default_10),
            width:double.infinity,child: Text(tr("products"),style: S.h2(color: C.GREY_2,),textAlign: TextAlign.start,),),
          Expanded(child: _ratesList(),),
          _nots(),
          BaseButton(onItemClickListener: (){
            /// call rate api
            if(ordersRates.isEmpty){
              Fluttertoast.showToast(msg:tr("select_rate"));
            }else{
              _rateOrder();
            }
          }, title: tr("order_rate"),textStyle: S.h3(color: Colors.white),)
        ],),
        ratesProvider!.isLoading?LoadingProgress(onlyProgress: true,):Container()
      ],),
    );
  }

  void _rateOrder(){
    Map<String,dynamic>body={};
    body["order_id"]=widget.order.id??0;
    body["rate"]=_notesController.text;
    body["products"]="[${ordersRates.join(",")}]";
    ratesProvider!.setOrderRates(body,context);
  }

  Widget _header(){
    return Container(child: Column(children: [
      Text(tr("order_rate"),style: S.h1(color: C.GREY_2),),
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
      return _listItem(index);
    }, separatorBuilder: (BuildContext context, int index) {
      return Container(height: D.default_1,color: C.GREY_4,width: double.infinity,);
    }, itemCount: widget.order.cartItems!.length,);
  }

  Widget _listItem(int index){
    return Container(
      margin: EdgeInsets.all(D.default_10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TransitionImage(
            widget.order.cartItems![index].photo??"",
            width: D.default_70,
            height: D.default_70,
            fit: BoxFit.cover,
          ),
          SizedBox(width: D.default_10,),
          Expanded(flex:1,child: Text(widget.order.cartItems![index].title??"",style: S.h3(color: C.GREY_1,))),
          RatingBar.builder(
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: D.default_25,
            direction: Axis.horizontal,
            unratedColor: C.GREY_4,
            onRatingUpdate: (double value) {
              ordersRates[index]="{${"id"}:${widget.order.cartItems![index].id},${"rate"}:${value.toInt()}}";
            },
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
          child: Text(tr("add_u_rate"),style: S.h3(color: C.GREY_1),),),
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
              hintText:tr("write_here"),
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
