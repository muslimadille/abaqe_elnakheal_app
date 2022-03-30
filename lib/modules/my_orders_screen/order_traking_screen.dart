import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/modules/my_orders_screen/rating_order_widget.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_botton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../dio/models/my_orders_model.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import '../../utils/widgets/transition_image.dart';

class OrderTrakingScreen extends StatefulWidget {
  OrderData order;
   OrderTrakingScreen(this.order,{Key? key}) : super(key: key);

  @override
  _OrderTrakingScreenState createState() => _OrderTrakingScreenState();
}

class _OrderTrakingScreenState extends State<OrderTrakingScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(body: SafeArea(child: Container(
      width: double.infinity,
      height: double.infinity,
      color: C.GREY_5,
      child: Column(
        children: [
          _header(context),
          Expanded(child: _mainBody())],
      ),
    ),));
  }
  Widget _mainBody(){
    return SingleChildScrollView(
      child: Column(children: [
        _trakingItem(),
        _contacts(),
        _productsList(),
        _coastPart(),
      ],),
    );
  }
  Widget _header(BuildContext ctx){
    return Container(
      height: D.default_80,
      padding: EdgeInsets.only(left: D.default_20,right: D.default_20),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed:(){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios,color: C.GREY_1,size: D.default_25,),),
          Expanded(child: Text(tr("order_details"),style: S.h2(color: C.GREY_2,),textAlign: TextAlign.center,)),
          Text(tr('help'),style: S.h2(color: C.BLUE_1,),textAlign: TextAlign.center,),

        ],),);
  }
  Widget _trakingItem(){
    return Container(
      width: double.infinity,
      color: Colors.white,
      margin: EdgeInsets.only(top: D.default_10,bottom: D.default_10,),
      padding: EdgeInsets.only(top: D.default_10,bottom: D.default_10,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TransitionImage(widget.order.cartItems![0].photo!,height: D.default_170,width: D.default_170,fit: BoxFit.cover,),
          Text("${tr("order_num")}:${widget.order.id}",style: S.h2(color: C.GREY_2),),
          Text("${widget.order.createdAt}",style: S.h3(color: C.GREY_4),),
          Container(
            margin: EdgeInsets.only(top:D.default_10,bottom: D.default_10,left:D.default_10,right:D.default_10),
            padding: EdgeInsets.only(top:D.default_5,bottom: D.default_5,left:D.default_10,right:D.default_10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(D.default_5)),
              color: C.BLUE_2.withOpacity(0.5),
            ),
            child: Text(widget.order.statusText!.name!,style: S.h4(color: C.BLUE_1),),
          ),
          _trakingList()

        ],),
    );
  }

  Widget _coastPart(){
    return Container(
      width: double.infinity,
      height: D.default_300,
      color: Colors.white,
      padding: EdgeInsets.only(top:D.default_20,left:D.default_20,right: D.default_20),
      child: Column(
        children: [
          Container(color: C.GREY_5,height: D.default_5,width: D.default_150,),
          SizedBox(height: D.default_15,),
          Container(
            width: double.infinity,
            child: Text(tr("order_details"),style: S.h3(color: C.GREY_1),textAlign: TextAlign.start,),),
          SizedBox(height: D.default_15,),
          Expanded(child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tr("all_cost"),style: S.h4(color: C.GREY_3),),
                Text("120 جم",style: S.h4(color: C.GREY_3),)
              ],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tr("shipping_fee"),style: S.h4(color: C.GREY_3),),
                Text("20 جم",style: S.h4(color: C.GREY_3),)
              ],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tr("total_cost"),style: S.h3(color: C.BLUE_1),),
                Text("120 جم",style: S.h3(color: C.BLUE_1),)
              ],)
          ],),),
          BaseButton(onItemClickListener: (){
            MyUtils.showBottomSheet(context, RatesOrderScreen(), D.default_300*2);
          }, title: tr("rate_products"),margin: EdgeInsets.zero,height: D.default_60,
            textStyle: S.h2(color: Colors.white),),
          Container(
            margin: EdgeInsets.all(D.default_10),
            child: Text(tr("openion"),style: S.h4(color: C.GREY_3),),)
        ],
      ),
    );
  }
  Widget _contacts(){
    return Container(
      width: double.infinity,
      color: Colors.white,
      margin: EdgeInsets.only(bottom: D.default_10,),
      padding: EdgeInsets.only(top: D.default_10,bottom: D.default_10,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top:D.default_20,left: D.default_20,right: D.default_20),
            child: Text(tr("shipping_details"),style: S.h3(color: C.GREY_2),),),
         Container(
           margin: EdgeInsets.only(left:D.default_20,right: D.default_20),
           child:  Row(children: [
           TransitionImage(
             "assets/images/location_ic_blue.png",
             fit:BoxFit.cover,
             width: D.default_25,
             height: D.default_25,),
           Container(
             margin: EdgeInsets.all(D.default_10),
             child: Text("82امتداد حسن المأمون مدينه نصر, القاهرة",style: S.h4(color: C.GREY_3),),)
         ],),),
          Container(
            margin: EdgeInsets.only(left:D.default_20,right: D.default_20),
            child:  Row(children: [
              TransitionImage(
                "assets/images/call_img.png",
                fit:BoxFit.cover,
                width: D.default_25,
                height: D.default_25,),
              Container(
                margin: EdgeInsets.all(D.default_10),
                child: Text("01152478962",style: S.h4(color: C.GREY_3),),)
            ],),)
        ],),
    );
  }
  Widget _trackItem({required String title, required bool isDone,  bool showDots=true}){
    return  Expanded(child: Container(
      height: D.default_100,
      child: Stack(
        clipBehavior: Clip.none,
        alignment:AlignmentDirectional.center,
        children: [
        Column(children: [
          isDone?Icon(Icons.check_circle,color: Colors.green,size: D.default_35,)
              :Icon(Icons.circle,color: C.GREY_4,size: D.default_35,),
          Text(title,style: S.h4(color: C.GREY_3),)
        ],),
          showDots?Positioned(child: Text("- - -",style: TextStyle(fontSize: 35,color: isDone?Colors.green:C.GREY_4,fontWeight: FontWeight.w200),textAlign: TextAlign.center,),
            left: -(MediaQuery.of(context).size.width/15),
            bottom: D.default_60*0.95,
          ):Container()
      ],),

    ));

  }
  Widget _productsList(){
    return Container(
      height: D.default_80*3,
      width: double.infinity,
      color: Colors.white,
      margin: EdgeInsets.only(bottom: D.default_10,),
      padding: EdgeInsets.only(top: D.default_10,bottom: D.default_10,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top:D.default_20,left: D.default_20,right: D.default_20),
            child: Text(tr("products"),style: S.h3(color: C.GREY_2),),),
          Expanded(flex:1,child: ListView.separated(itemBuilder: (context,index){
            return _productListItem();
          }, separatorBuilder: (context,index){
            return Container(height: D.default_1,color: C.GREY_4,);
          }, itemCount: 2,
              physics: const NeverScrollableScrollPhysics(),
          )),
        ],),
    );
  }
  Widget _productListItem(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: D.default_10,left: D.default_20,right: D.default_20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("x1",style: S.h4(color: C.GREY_4),),
          SizedBox(width: D.default_10,),
          TransitionImage(
            "assets/images/rice_img.png",
            width: D.default_70,
            height: D.default_70,
            radius: D.default_5,
            fit:BoxFit.cover,
          ),
          Expanded(child: Container(
            margin: EdgeInsets.only(left: D.default_10,right: D.default_10,top: D.default_10,bottom: D.default_10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("سماد طبيعي للتزهير والانبات بتركيز10%",style: S.h3(color: C.GREY_1),),
              ],),)),
          Text("10جم",style: S.h4(color: C.GREY_3),)

        ],),

    );
  }
  Widget _trakingList(){
    return Container(
      height: D.default_120,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _trackItem(isDone: true, title: 'تحت الطلب'),
          _trackItem(isDone: true, title: 'قيد التفيذ'),
          _trackItem(isDone: false, title: 'قيد التوصيل'),
          _trackItem(isDone: false, title: 'تم التوصيل',showDots: false),
        ],),);
  }
}
