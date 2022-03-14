import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/modules/main_tabs_screen/main_tabs_screen.dart';
import 'package:abaqe_elnakheal_app/modules/otp/send_email_screen.dart';
import 'package:abaqe_elnakheal_app/modules/registeration/registeration_screen.dart';
import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/res.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_botton.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_text_files.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/login_provider.dart';
import '../../utils/input_validation_mixin.dart';
import '../../utils/widgets/loading_widget.dart';
import 'item/back_btn_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with InputValidationMixin{
  final _loginFormGlobalKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  LoginProvider?loginProvider;
  @override
  void initState() {
    super.initState();
    loginProvider = Provider.of<LoginProvider>(context, listen: false);

  }


  @override
  Widget build(BuildContext context) {
    loginProvider = Provider.of<LoginProvider>(context, listen: true);
    return BaseScreen(body: SafeArea(child: Stack(
      alignment:AlignmentDirectional.center,
      children: [
        TransitionImage(Res.LOGIN_BG,fit: BoxFit.cover,
          width: double.infinity,height: double.infinity,),
        Container(
          margin: EdgeInsets.only(left: D.default_40,right: D.default_40),
          width: double.infinity,
          child: Column(children: [
            _backBtn(context),
            Expanded(child: SingleChildScrollView(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: D.default_70,),
                _titleText(),
                _introText(),
                SizedBox(height: D.default_50,),
                _socialLogin(),
                _deviderPart(),
                SizedBox(height: D.default_20,),
                _loginForm(),
                _forgetPassword(),
                SizedBox(height: D.default_50,),
                _loginButton(),
                _registerButton(),
                _skip(),
                SizedBox(height: D.default_60,)
              ],),))
          ],),),
        loginProvider!.isLoading? LoadingProgress():Container()
      ],
    ),));
  }
  Widget _backBtn(BuildContext ctx){
    return Container(
      padding: EdgeInsets.only(top:D.default_10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BackBottonWidget(ctx)
    ],),);
  }
  Widget _introText(){
    return Container(
      width: double.infinity,
      child: Text(tr("welcome_text"),style: S.h3(color:C.GREY_3),textAlign: TextAlign.center,),);

  }
  Widget _titleText(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: D.default_10,bottom:D.default_10),
      child: Text(tr("login_title"),style: S.h1(color:Colors.black),textAlign: TextAlign.center,),);

  }
  Widget _socialLogin(){
    return Container(
      margin: EdgeInsets.all(D.default_10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){},
            child: TransitionImage(
            Res.GOOGLE_IC,
            width: D.default_50,
            height: D.default_50,
          ),),
         InkWell(
           onTap:(){},
           child:TransitionImage(
           Res.APPLE_IC,
           width: D.default_50,
           height: D.default_50,
         ),),



        ],),
    );
  }

  Widget _loginButton(){
    return BaseButton(
      onItemClickListener: (){
        _onLoginClicked();
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
  Widget _deviderPart(){
    return Container(child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child:
        Container(
          height: D.default_1,
          width: D.default_100,
          color: C.GREY_4,),),
        Container(
        margin:EdgeInsets.all(D.default_10),
          child: Text(tr("or_text"),style: S.h3(color: C.GREY_2),),),
        Expanded(child: Container(height: D.default_1,width: D.default_100,color: C.GREY_4,))

      ],
    ),);
  }
  Widget _loginForm(){
    return Container(child:
      Form(
        key: _loginFormGlobalKey,
        child: Column(
          children: [
            BaseTextFiled(
              controller: _emailController,
              hint: tr("email"),
              validator: (name) {
                if (isFieldNotEmpty(name!)) {
                  return null;
                } else {
                  return tr("enter_email");
                }
              },
            ),
            SizedBox(height: D.default_15,),
            BaseTextFiled(
              controller: _passwordController,
              hint: tr("password"),
              isPassword: true,
              validator: (name) {
                if (isFieldNotEmpty(name!)) {
                  return null;
                } else {
                  return tr("enter_password");
                }
              },
            ),
          ],
        ),
      ),);
  }
  Widget _forgetPassword(){
    return InkWell(
      onTap: (){
        MyUtils.navigate(context, SendOtpEmailScreen());
      },
      child: Container(
        padding: EdgeInsets.only(top: D.default_15,bottom: D.default_15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(tr("forget_password"),style: S.h3(color: C.GREY_1),)
          ],)),);
  }
  _onLoginClicked() {
    if (_loginFormGlobalKey.currentState!.validate()) {
      _loginFormGlobalKey.currentState!.save();
      loginProvider!.login(
          context,
          _emailController.text,
          _passwordController.text);
    }
  }
}
