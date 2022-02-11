import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_botton.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
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
  bool _showData=false;
  @override
  Widget build(BuildContext context) {
    return BaseScreen(body: SafeArea(child:
      Container(
        width: double.infinity,
        height: double.infinity,
        color: C.GREY_5,
        child: Column(
          children: [
            _header(context),
            _showData?Expanded(child: _mainBody())
                :Expanded(child: InkWell(
              onTap: (){
                setState(() {
                  _showData=true;
                });
              },
              child: NoDataWidget(
                  image: "assets/lottie/shopping_error_bg.json",
                  title: "لاتوجد منتجات حالية",
                  subTitle: "لم تضف شيء الي سلة التسوق الخاصة بك حتي الان! ابدأ التسوق واصف منتجاتك",
                height: D.default_150,
                width: D.default_150,
              ),),)

          ],
        ),
      ),));
  }
  Widget _mainBody(){
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
          Expanded(child: Text("سلة التسوق",style: S.h2(color: C.GREY_2,),textAlign: TextAlign.center,)),
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
          child: Text("المنتجات",style: S.h3(color: C.GREY_2),),),
        Expanded(flex:1,child: ListView.separated(itemBuilder: (context,index){
          return _productListItem();
        }, separatorBuilder: (context,index){
          return Container(height: D.default_1,color: C.GREY_4,);
        }, itemCount: 2)),
      ],),
    );
  }
  Widget _productListItem(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: D.default_10,left: D.default_20,right: D.default_20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("سماد طبيعي للتزهير والانبات بتركيز10%",style: S.h3(color: C.GREY_1),),
                Text("85جم",style: S.h4(color: C.GREY_4),)

              ],),)),
          _counter()
        ],),

    );
  }
  Widget _counter(){
    return Container(
      width: D.default_150,
      margin: EdgeInsets.only(top:D.default_12,bottom:D.default_12),
      child: Row(children: [
        _bottonWidget(Icons.delete_outlined,(){
          setState(() {
          });
        }),
        Expanded(child: Text("1 كيلو",style: S.h4(color: C.GREY_3),textAlign: TextAlign.center,)),
        _bottonWidget(Icons.add,(){
          setState(() {
          });
        }),

      ],),);
  }
  Widget _bottonWidget(IconData icon,Function onClick){
    return Container(
        height: D.default_35,
        width: D.default_35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(D.default_5),
          color: C.BLUE_2.withOpacity(0.4),
        ),
        child: InkWell(
          onTap: (){onClick();},
          child: Center(child:  Icon(icon,color: C.BLUE_1,size: D.default_25,),),)) ;
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
            child: Text("تفاصيل الطلب",style: S.h3(color: C.GREY_1),textAlign: TextAlign.start,),),
          SizedBox(height: D.default_15,),
          Expanded(child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("إجمالي العربة",style: S.h4(color: C.GREY_3),),
                Text("120 جم",style: S.h4(color: C.GREY_3),)
            ],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("مصاريف الشحن",style: S.h4(color: C.GREY_3),),
                Text("20 جم",style: S.h4(color: C.GREY_3),)
              ],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("المجموع الكلي",style: S.h3(color: C.BLUE_1),),
                Text("120 جم",style: S.h3(color: C.BLUE_1),)
              ],)
          ],),),
          BaseButton(onItemClickListener: (){
            MyUtils.navigate(context, CompleteOrderScreen());
          }, title: "الذهاب لتنفيذ الطلب",margin: EdgeInsets.zero,height: D.default_60,
          textStyle: S.h2(color: Colors.white),),
          Container(
            margin: EdgeInsets.all(D.default_10),
            child: Text("يمكنك إضافة كوبون الخصم في الخطوة القادمة",style: S.h4(color: C.GREY_3),),)
        ],
      ),
    );
  }
}
