import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/modules/cart/add_cobon_widget.dart';
import 'package:abaqe_elnakheal_app/modules/cart/change_address_widget.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_botton.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:flutter/material.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import '../home/items/card_icon.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'complete_order_widget.dart';


class CompleteOrderScreen extends StatefulWidget {
  const CompleteOrderScreen({Key? key}) : super(key: key);

  @override
  _CompleteOrderScreenState createState() => _CompleteOrderScreenState();
}


class _CompleteOrderScreenState extends State<CompleteOrderScreen> {
  TextEditingController _notesController=TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();

  }



  @override
  Widget build(BuildContext context) {
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
          Expanded(child: Text("سلة التسوق",style: S.h2(color: C.GREY_2,),textAlign: TextAlign.center,)),
          Container(width: D.default_50,),

        ],),);
  }
  Widget _coastPart(){
    return Container(
      width: double.infinity,
      height: D.default_250,
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
            MyUtils.showBottomSheet(context, CompleteOrderWidget(), MediaQuery.of(context).size.height*0.65);
          }, title: "تنفيذ الطلب",height: D.default_60,
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
          Text("عنوان التوصيل",style: S.h4(color:C.GREY_3),),
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
            child: Center(child: Text("تغيير",style: S.h4(color: Colors.white),),),),)

        ],),
        Container(child: Text("المنزل",style: S.h3(color: C.GREY_1),),),
          Row(children: [
            TransitionImage(
              "assets/images/location_ic_blue.png",
              fit:BoxFit.cover,
              width: D.default_20,
              height: D.default_20,),
            Container(
              margin: EdgeInsets.all(D.default_10),
              child: Text("82امتداد حسن المأمون مدينه نصر, القاهرة",style: S.h4(color: C.GREY_4),),)
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
            child: Text("ملاحظات هامة(اختياري)",style: S.h3(color: C.GREY_1),),),
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
          Text("اضافة كوبون خصم",style: S.h3(color: C.GREY_1),),
          Icon(Icons.arrow_forward_ios,color: C.GREY_1,size: D.default_20,)
        ],),
      ),
    );
  }
}
