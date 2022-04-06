import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/modules/login_screen/login_screen.dart';
import 'package:abaqe_elnakheal_app/modules/registeration/registeration_screen.dart';
import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/res.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_botton.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../main_tabs_screen/main_tabs_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(body: Stack(
      alignment:AlignmentDirectional.bottomCenter,
      children: [
        TransitionImage(Res.ON_BOARDING_BG,fit: BoxFit.cover,
          width: double.infinity,height: double.infinity,),
        Container(
          margin: EdgeInsets.only(left: D.default_40,right: D.default_40),
          width: double.infinity,
          height: D.default_300*1.7,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            _logo(),
              SizedBox(height: D.default_10,),

              _introText(),
              SizedBox(height: D.default_20,),
              _loginButton(),
            _registerButton(),
            _skip(),
              SizedBox(height: D.default_60,)
          ],),)


      ],
    ));
  }
  Widget _logo(){
    return TransitionImage(Res.LOGO_NAME,fit: BoxFit.fitWidth,
        width:D.default_250);
  }
  Widget _introText(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: D.default_10,bottom:D.default_10),
      child: Text(tr("onborading_text"),style: S.h2(color:C.GREY_1),textAlign: TextAlign.center,),);

  }
  Widget _loginButton(){
    return BaseButton(
      onItemClickListener: (){
        MyUtils.navigate(context, LoginScreen());
      },
      title: tr("login_title"),
      color: C.BLUE_1,
      textStyle: S.h3(color: Colors.white),
      margin: EdgeInsets.all(D.default_5),
    );
  }
  Widget _registerButton(){
    return BaseButton(
      onItemClickListener: (){
        MyUtils.navigate(context, RegisterationScreen());
      },
      title: tr("register_title"),
      color: C.GREY_4,
      textStyle: S.h3(color: C.GREY_1),
      enableShadow: false,
      margin: EdgeInsets.all(D.default_5),

    );
  }
  Widget _skip(){
    return BaseButton(
      onItemClickListener: (){
        MyUtils.navigate(context, MainTabsScreen());
      },
      title: tr("skip_title"),
      textStyle: S.h2(color: C.BLUE_1,underline: true),
      margin: EdgeInsets.all(0),
      enableShadow: false,
      color: Colors.white,

    );

  }
}
