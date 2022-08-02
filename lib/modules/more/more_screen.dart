import 'package:abaqe_elnakheal_app/modules/login_screen/login_screen.dart';
import 'package:abaqe_elnakheal_app/modules/more/profile_screen.dart';
import 'package:abaqe_elnakheal_app/modules/more/settings_screen.dart';
import 'package:abaqe_elnakheal_app/utils/constants.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:flutter/material.dart';
import '../../utils/apis.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets/transition_image.dart';
import '../home/items/card_icon.dart';
import '../base_screen/base_screen.dart';
import '../splash_screen/spalsh_screen.dart';
import 'about_widget.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return BaseScreen(body: SafeArea(child: Column(children: [
      _header(),
      Expanded(child: Container(
        margin: EdgeInsets.only(top: D.default_20,bottom: D.default_20),
        child: Column(children: [
          _userIfo(),
          _profileBtn(),
          _devider(),
          _editProfileBtn(),
          _devider(),
          _aboutBtn(),
          _devider(),
          _logOutBtn()
        ],),))
    ],),));
  }
  Widget _header(){
    return Container(
      margin: EdgeInsets.all(D.default_30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Expanded(child: Text(tr("settings"),style: S.h1(color: C.GREY_1),),),
            CardIconWidget(),
          ],),
          Text(tr("settings_subtitle"),style: S.h3(color: C.GREY_3),),
        ],),
    );
  }
  Widget _userIfo(){
    return Container(
      margin: EdgeInsets.all(D.default_20),
      child: Row(children: [
      TransitionImage("assets/images/avatar_img.png",
        height: D.default_60,
        width: D.default_60,
        fit: BoxFit.cover,
      ),
      Expanded(child: Container(
        margin: EdgeInsets.only(left:D.default_15,right: D.default_15),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${Constants.currentUser!.username} ${Constants.currentUser!.lastName}",style: S.h3(color: C.GREY_1),),
          Text("${Constants.currentUser!.phone}",style: S.h4(color: C.GREY_3),)
        ],),))

    ],),);
  }
 Widget _profileBtn(){
    return InkWell(
      onTap: (){
        MyUtils.navigate(context, ProfileScreen());
      },
      child: Container(
      padding: EdgeInsets.all(D.default_20),
      child:
      Row(children: [
        TransitionImage("assets/images/profile_img.png",height: D.default_40,width: D.default_40,
          fit: BoxFit.cover,
        ),
        Expanded(child: Container(
          margin: EdgeInsets.only(left: D.default_20,right: D.default_20),
          child: Text(tr("profile"),style: S.h4(color: C.GREY_2),),)),
        Icon(Icons.arrow_forward_ios,color: C.GREY_2,size: D.default_20,)
      ],)
      ,),) ;
}
  Widget _editProfileBtn(){
    return InkWell(
      onTap: (){
        MyUtils.navigate(context, SettingsScreen());
      },
      child: Container(
        padding: EdgeInsets.all(D.default_20),
        child:
        Row(children: [
          TransitionImage("assets/images/profile_setting_img.png",height: D.default_40,width: D.default_40,
            fit: BoxFit.cover,
          ),
          Expanded(child: Container(
            margin: EdgeInsets.only(left: D.default_20,right: D.default_20),
            child: Text(tr("profile_settings"),style: S.h4(color: C.GREY_2),),)),
          Icon(Icons.arrow_forward_ios,color: C.GREY_2,size: D.default_20,)
        ],)
        ,),) ;
  }
  Widget _aboutBtn(){
    return InkWell(
      onTap: (){
        MyUtils.showBottomSheet(context, AboutWidget(), MediaQuery.of(context).size.height*0.6);

      },
      child: Container(
        padding: EdgeInsets.all(D.default_20),
        child:
        Row(children: [
          TransitionImage("assets/images/about_app_img.png",height: D.default_40,width: D.default_40,
            fit: BoxFit.cover,
          ),
          Expanded(child: Container(
            margin: EdgeInsets.only(left: D.default_20,right: D.default_20),
            child: Text(tr("about_app"),style: S.h4(color: C.GREY_2),),)),
          Icon(Icons.arrow_forward_ios,color: C.GREY_2,size: D.default_20,)
        ],)
        ,),) ;
  }
  _unSubscripeUser()async{
    await Constants.prefs!.setBool(Constants.IS_LOGIN!,false);
    await Constants.prefs!.setBool(Constants.IS_SOCIAL_LOGIN!,false);
    await Constants.prefs!.setString(Constants.SAVED_EMAIL_KEY!,"");
    await Constants.prefs!.setString(Constants.SAVED_PASSWORD_KEY!,"");
    await Constants.prefs!.setString(Constants.SOCIAL_LOGIN_FIRST_NAME!,"");
    await Constants.prefs!.setString(Constants.SOCIAL_LOGIN_LAST_NAME!,"");
    await Constants.prefs!.setString(Constants.SOCIAL_LOGIN_ID!,"");
    await Constants.prefs!.setString(Constants.SOCIAL_LOGIN_EMAIL!,"");
    await Constants.prefs!.setString(Constants.SOCIAL_LOGIN_PROVIDER!,"");
    await Constants.prefs!.setString(Constants.SAVED_PHONE_KEY!,"");
    await Constants.prefs!.setString(Constants.SAVED_PASSWORD_KEY!,"");
    Apis.TOKEN_VALUE="";
    Constants.currentUser=null;
  }
  Widget _logOutBtn(){
    return InkWell(
      onTap: ()async{
       await _unSubscripeUser();
        MyUtils.navigateAsFirstScreen(Constants.tabScreenContext!, LoginScreen());
        googleSignIn.signOut();
      },
      child: Container(
        padding: EdgeInsets.all(D.default_20),
        child:
        Row(children: [
          TransitionImage("assets/images/logout_img.png",height: D.default_40,width: D.default_40,
            fit: BoxFit.cover,
          ),
          Expanded(child: Container(
            margin: EdgeInsets.only(left: D.default_20,right: D.default_20),
            child: Text(tr("log_out"),style: S.h4(color: C.GREY_2),),)),
          Icon(Icons.arrow_forward_ios,color: C.GREY_2,size: D.default_20,)
        ],)
        ,),) ;
  }

Widget _devider(){
    return Container(height: D.default_1,color: C.GREY_5,width: double.infinity,);
}
}
