import 'package:abaqe_elnakheal_app/dio/models/region_model.dart';
import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/modules/cart/add_cobon_widget.dart';
import 'package:abaqe_elnakheal_app/modules/cart/change_address_widget.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_botton.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import '../../providers/regions_provider.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'complete_order_widget.dart';


class CompleteOrderScreen extends StatefulWidget {
  const CompleteOrderScreen({Key? key}) : super(key: key);

  @override
  _CompleteOrderScreenState createState() => _CompleteOrderScreenState();
}


class _CompleteOrderScreenState extends State<CompleteOrderScreen> {
  TextEditingController _notesController=TextEditingController();
  CartProvider? cartProvider;
  RegionsProvider?regionsProvider;
  double allPrice=0;
  double allDiscount=0;
  double totalPrice=0;



  @override
  void initState() {
    super.initState();
    regionsProvider=Provider.of<RegionsProvider>(context,listen: false);
    cartProvider=Provider.of<CartProvider>(context,listen: false);
    cartProvider!.couponCost=0;
  }
  @override
  void dispose() {
    super.dispose();

  }



  @override
  Widget build(BuildContext context) {
    regionsProvider=Provider.of<RegionsProvider>(context,listen: true);
    cartProvider=Provider.of<CartProvider>(context,listen: true);
    _getProductCost();
    return BaseScreen(body: SafeArea(child:
    Container(
      width: double.infinity,
      height: double.infinity,
      color: C.GREY_5,
      child: Column(
        children: [
          Expanded(child: SingleChildScrollView(child: Column(children: [
            _header(context),
            _addressPart(),
            _notesPart(),
            _cobonBtn(),
          ],),)),
          KeyboardVisibilityBuilder(
              builder: (context, isKeyboardVisible) {
                return  isKeyboardVisible?Container(): _coastPart();
              }
          )
        ],
      ),
    ),));
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
          Expanded(child: Text(tr("cart"),style: S.h2(color: C.GREY_2,),textAlign: TextAlign.center,)),
          Container(width: D.default_50,),

        ],),);
  }
  Widget _coastPart(){
    return Container(
      width: double.infinity,
      height: D.default_300*1.05,
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
                Text(tr("cart_sum"),style: S.h4(color: C.GREY_3),),
                Text("${allPrice}${tr("currency")}",style: S.h4(color: C.GREY_3),)
              ],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tr("cart_discount"),style: S.h4(color: C.GREY_3),),
                Text("${allDiscount}${tr("currency")}",style: S.h4(color: C.GREY_3),)
              ],),
            cartProvider!.couponCost>0?Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tr("coupon_coast"),style: S.h4(color: C.GREY_3),),
                Text("${cartProvider!.couponCost} ${tr("currency")}",style: S.h4(color: C.GREY_3),)
              ],):Container(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tr("shipping_coast"),style: S.h4(color: C.GREY_3),),
                Text("${cartProvider!.myCartModel!.deliveryPrice} ${tr("currency")}",style: S.h4(color: C.GREY_3),)
              ],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tr("total_cost"),style: S.h3(color: C.BLUE_1),),
                Text("${totalPrice}${tr("currency")}",style: S.h3(color: C.BLUE_1),)
              ],),
            SizedBox(height: D.default_10,),
          ],),),
          BaseButton(onItemClickListener: (){
            MyUtils.showBottomSheet(context, CompleteOrderWidget(), MediaQuery.of(context).size.height*0.65);
          }, title: tr("complete_order2"),height: D.default_60,
            textStyle: S.h2(color: Colors.white),),
        ],
      ),
    );
  }
  Widget _addressPart(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: D.default_10),
      padding: EdgeInsets.only(top:D.default_10,bottom: D.default_10,left: D.default_20,right: D.default_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(tr("shipping_address"),style: S.h4(color:C.GREY_3),),
          InkWell(onTap: (){
            MyUtils.showBottomSheet(context, ChangeAddresWidget(), MediaQuery.of(context).size.height*0.7);
          },
          child: Container(
            padding: EdgeInsets.only(top:D.default_5,bottom: D.default_5,left: D.default_20,right: D.default_20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(D.default_50),
                color: C.GREY_1,
                boxShadow:[BoxShadow(
                    color: C.BLUE_1.withOpacity(0.3),
                    offset:Offset(1,1),
                    blurRadius:5,
                    spreadRadius: 1
                )]
            ),
            child: Center(child: Text(tr("change"),style: S.h4(color: Colors.white),),),),)

        ],),
        Container(child: Text(tr("home_location"),style: S.h3(color: C.GREY_1),),),
          Row(children: [
            TransitionImage(
              "assets/images/location_ic_blue.png",
              fit:BoxFit.cover,
              width: D.default_20,
              height: D.default_20,),
            Container(
              margin: EdgeInsets.all(D.default_10),
              child: Text(cartProvider!.myCartModel!.userAddresses!.isNotEmpty?cartProvider!.myCartModel!.userAddresses![0].address!:tr("add_location"),style: S.h4(color: C.GREY_4),),)
          ],)


      ],),
    );
  }
  Widget _notesPart(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: D.default_10),
      padding: EdgeInsets.only(top:D.default_10,bottom: D.default_10,left: D.default_20,right: D.default_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: D.default_10),
            child: Text(tr("your_notes"),style: S.h3(color: C.GREY_1),),),
          Container(
            height: D.default_120,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(D.default_10),
                border: Border.all(color: C.GREY_4,width: D.default_1)
              ),
            child: TextFormField(
              controller: _notesController,
              style: S.h3(color: C.GREY_1),
              decoration: InputDecoration(
                  hintText: tr("write_here"),
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
      ],),
    );
  }
  Widget _cobonBtn(){
    return InkWell(onTap: (){
      MyUtils.showBottomSheet(context, AddCoboneWidget(), D.default_250);
    },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: D.default_10),
        padding: EdgeInsets.only(top:D.default_10,bottom: D.default_10,left: D.default_20,right: D.default_20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text(tr("add_cobon"),style: S.h3(color: C.GREY_1),),
          Icon(Icons.arrow_forward_ios,color: C.GREY_1,size: D.default_20,)
        ],),
      ),
    );
  }

  _getProductCost(){
    for(int i=0;i<cartProvider!.myCartModel!.items!.length;i++){
      allPrice=allPrice+(double.parse(cartProvider!.myCartModel!.items![i].price!)*cartProvider!.myCartModel!.items![i].quantity!);
      allDiscount=allDiscount+(((double.parse(cartProvider!.myCartModel!.items![i].price!)-double.parse(cartProvider!.myCartModel!.items![i].offerPrice!))*cartProvider!.myCartModel!.items![i].quantity!));
      totalPrice=totalPrice+(allPrice-allDiscount-cartProvider!.myCartModel!.deliveryPrice!);
    }
  }


}
