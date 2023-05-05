import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_botton.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/loading_widget.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/no_data_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import '../../utils/widgets/transition_image.dart';
import '../home/items/card_icon.dart';
import 'complete_order_screen.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  CartProvider? cartProvider;
  double allPrice=0;
  double allDiscount=0;
  double totalPrice=0;

  @override
  void initState() {
    super.initState();
    cartProvider=Provider.of<CartProvider>(context,listen: false);
    cartProvider!.getCartItems();
  }
  @override
  Widget build(BuildContext context) {
    cartProvider=Provider.of<CartProvider>(context,listen: true);
    return BaseScreen(body: SafeArea(child:
      Container(
        width: double.infinity,
        height: double.infinity,
        color: C.GREY_5,
        child: Column(
          children: [
            _header(context),
            cartProvider!.isLoading?Expanded(child: LoadingProgress()):cartProvider!.myCartModel!.items!.isNotEmpty?Expanded(child: _mainBody())
                :Expanded(child: NoDataWidget(
              image: "assets/lottie/shopping_error_bg.json",
              title: tr("no_product"),
              subTitle: tr("cart_no_product_subtitle"),
              height: D.default_150,
              width: D.default_150,
            ),)

          ],
        ),
      ),));
  }
  Widget _mainBody(){
    _getProductCost();
    return Column(children: [
     Expanded(child:  _productsList()),
      Expanded(flex:0,child: Container()),
      _coastPart()
    ],);
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
          }, icon: Icon(Icons.close,color: C.GREY_1,size: D.default_25,),),
          Expanded(child: Text(tr("cart"),style: S.h2(color: C.GREY_2,),textAlign: TextAlign.center,)),
          CardIconWidget(isDarkBG: false,),

        ],),);
  }
  Widget _productsList(){
    return Container(
      padding: EdgeInsets.only(top: D.default_10,bottom: D.default_10,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.only(top:D.default_20,left: D.default_20,right: D.default_20),
          child: Text(tr("products"),style: S.h3(color: C.GREY_2),),),
        Expanded(flex:1,child: ListView.separated(itemBuilder: (context,index){
          return _productListItem(index);
        }, separatorBuilder: (context,index){
          return Container(height: D.default_1,color: C.GREY_4,);
        }, itemCount: cartProvider!.myCartModel!.items!.length)),
      ],),
    );
  }
  Widget _productListItem(int index){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: D.default_10,left: D.default_20,right: D.default_20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TransitionImage(
            cartProvider!.myCartModel!.items![index].photo??"assets/images/rice_img.png",
            width: D.default_70,
            height: D.default_70,
            radius: D.default_5,
            fit:BoxFit.cover,
          ),
          Expanded(child: Container(
            margin: EdgeInsets.only(left: D.default_10,right: D.default_10,top: D.default_10,bottom: D.default_10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cartProvider!.myCartModel!.items![index].title??"",style: S.h3(color: C.GREY_1),),
                Text("${cartProvider!.myCartModel!.items![index].price} ${tr("currency")}",style: S.h4(color: C.GREY_4),)

              ],),)),
          _counter(index)
        ],),

    );
  }
  Widget _counter(int index){
    return Container(
      width: D.default_150,
      margin: EdgeInsets.only(top:D.default_12,bottom:D.default_12),
      child: Row(children: [
        _bottonWidget(Icons.delete_outlined,()async{
          setState(() async {
            /*if(cartProvider!.myCartModel!.items![index].quantity!>cartProvider!.myCartModel!.items![index].minQuantity!){
              await cartProvider!.addToCart(cartProvider!.myCartModel!.items![index].itemId!,cartProvider!.myCartModel!.items![index].quantity!-1,hideLoading: true);
            }else{
            await cartProvider!.addToCart(cartProvider!.myCartModel!.items![index].itemId!,0,hideLoading: true);
            }*/
            await cartProvider!.addToCart(cartProvider!.myCartModel!.items![index].itemId!,0,hideLoading: true);
          });
        },()async{
          setState(() async {
            await cartProvider!.addToCart(cartProvider!.myCartModel!.items![index].itemId!,0,hideLoading: true);
          });
        }),
        Expanded(child: Text("${cartProvider!.myCartModel!.items![index].quantity}${tr("kg")}",style: S.h4(color: C.GREY_3),textAlign: TextAlign.center,)),
        _bottonWidget(Icons.add,(){
          setState(() async{
            await cartProvider!.addToCart(cartProvider!.myCartModel!.items![index].itemId!,cartProvider!.myCartModel!.items![index].quantity!+1,hideLoading:true);
          });
        },(){}),

      ],),);
  }
  Widget _bottonWidget(IconData icon,Function onClick,Function onLongClick){
    return Container(
        height: D.default_35,
        width: D.default_35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(D.default_5),
          color: C.BLUE_2.withOpacity(0.4),
        ),
        child: InkWell(
          onLongPress: (){onLongClick();},
          onTap: (){onClick();},
          child: Center(child:  Icon(icon,color: C.BLUE_1,size: D.default_25,),),)) ;
  }
  Widget _coastPart(){
    return Container(
      width: double.infinity,
      height: D.default_300*1.07,
        color: Colors.white,
      padding: EdgeInsets.only(top:D.default_15,left:D.default_20,right: D.default_20),
      child: Column(
        children: [
          Container(color: C.GREY_5,height: D.default_5,width: D.default_150,),
          SizedBox(height: D.default_10,),
          Container(
            width: double.infinity,
            child: Text(tr("order_details"),style: S.h3(color: C.GREY_1),textAlign: TextAlign.start,),),
          SizedBox(height: D.default_10,),
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
            MyUtils.navigate(context, CompleteOrderScreen());
          }, title: tr("complete_order"),margin: EdgeInsets.zero,height: D.default_60,
          textStyle: S.h2(color: Colors.white),),
          Container(
            margin: EdgeInsets.all(D.default_10),
            child: Text(tr("cobone_hint"),style: S.h4(color: C.GREY_3),),)
        ],
      ),
    );
  }

   _getProductCost(){
     totalPrice=0;allDiscount=0;allPrice=0;
    for(int i=0;i<cartProvider!.myCartModel!.items!.length;i++){
      allPrice=allPrice+(double.parse(cartProvider!.myCartModel!.items![i].price!)*cartProvider!.myCartModel!.items![i].quantity!);
      allDiscount=allDiscount+(((double.parse(cartProvider!.myCartModel!.items![i].price!)-double.parse(cartProvider!.myCartModel!.items![i].offerPrice!))*cartProvider!.myCartModel!.items![i].quantity!));
    }
    totalPrice=allPrice-allDiscount;
  }

}


