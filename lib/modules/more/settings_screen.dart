import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/utils/constants.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets/transition_image.dart';
import '../home/items/card_icon.dart';
import '../login_screen/item/back_btn_widget.dart';
import 'change_language_widget.dart';
import 'change_password_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(body: SafeArea(child: Column(children: [
      _header(context),
      _devider(),
      _changeLangBtn(),
      _devider(),
      _changePasswordBtn()
    ],),));
  }
  Widget _header(BuildContext ctx){
    return Container(
      height: D.default_100,
      padding: EdgeInsets.all(D.default_30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BackBottonWidget(ctx),
          Expanded(child: Text(tr("profile_settings"),style: S.h1(color: C.GREY_1),textAlign: TextAlign.center,)),
          CardIconWidget(),

        ],),);

  }
  Widget _changeLangBtn(){
    return InkWell(
      onTap: (){
        MyUtils.showBottomSheet(context, ChangeLanguageWidget(), MediaQuery.of(context).size.height*0.265);
      },
      child: Container(
        padding: EdgeInsets.all(D.default_20),
        margin: EdgeInsets.only(left:D.default_10,right: D.default_10),

        child:
        Row(children: [
          TransitionImage("assets/images/language_img.png",height: D.default_40,width: D.default_40,
            fit: BoxFit.cover,
          ),
          Expanded(child: Container(
            margin: EdgeInsets.only(left: D.default_20,right: D.default_20),
            child: Text(tr("change_language"),style: S.h3(color: C.GREY_2),),)),
          Text(Constants.SELECTED_LANGUAGE=="ar"?"العربية":"English",style: S.h3(color: C.BLUE_2),),
          SizedBox(width: D.default_10,),
          Icon(Icons.arrow_forward_ios,color: C.GREY_1,size: D.default_20,)
        ],)
        ,),) ;
  }

  Widget _changePasswordBtn(){
    return InkWell(
      onTap: (){
        MyUtils.navigate(context, ChangePasswordScreen());
      },
      child: Container(
        padding: EdgeInsets.all(D.default_20),
        margin: EdgeInsets.only(left:D.default_10,right: D.default_10),

        child:
        Row(children: [
          TransitionImage("assets/images/lock_img.png",height: D.default_40,width: D.default_40,
            fit: BoxFit.cover,
          ),
          Expanded(child: Container(
            margin: EdgeInsets.only(left: D.default_20,right: D.default_20),
            child: Text(tr("change_password"),style: S.h3(color: C.GREY_2),),)),
          Icon(Icons.arrow_forward_ios,color: C.GREY_1,size: D.default_20,)
        ],)
        ,),) ;
  }



  Widget _devider(){
    return Container(height: D.default_1,color: C.GREY_5,width: double.infinity,);
  }

}
