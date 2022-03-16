import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/modules/otp/use_code_screen.dart';
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
import 'package:otp_text_field/otp_field.dart';
import 'package:provider/provider.dart';

import '../../providers/login_provider.dart';
import '../../utils/input_validation_mixin.dart';
import '../login_screen/data/login_api.dart';

class SendOtpEmailScreen extends StatefulWidget {
  const SendOtpEmailScreen({Key? key}) : super(key: key);

  @override
  _SendOtpEmailScreenState createState() => _SendOtpEmailScreenState();
}

class _SendOtpEmailScreenState extends State<SendOtpEmailScreen> with InputValidationMixin{
  final _loginFormGlobalKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  LoginProvider? loginProvider;

  @override
  void initState() {
    super.initState();
    loginProvider=Provider.of<LoginProvider>(context,listen:false);
  }

  @override
  Widget build(BuildContext context) {
    loginProvider=Provider.of<LoginProvider>(context,listen:true);
    return BaseScreen(body: SafeArea(child: Stack(
      alignment:AlignmentDirectional.center,
      children: [
        TransitionImage(Res.LOGIN_BG,fit: BoxFit.cover,
          width: double.infinity,height: double.infinity,),
        Container(
          margin: EdgeInsets.only(left: D.default_40,right: D.default_40),
          width: double.infinity,
          child: Column(children: [
            _backBtn(),
            Expanded(child: SingleChildScrollView(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: D.default_100,),
                _titleText(),
                _introText(),
                SizedBox(height: D.default_60,),
                _loginForm(),
                SizedBox(height: D.default_40,),
                _sendButton(),
                SizedBox(height: D.default_10,),
                _cancelButton()
              ],),))
          ],),)
      ],
    ),));
  }
  Widget _backBtn(){
    return Container(
      padding: EdgeInsets.only(top:D.default_10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(onPressed:(){
            Navigator.of(context).pop();
          }, icon: Icon(Icons.arrow_back_ios,color: C.GREY_1,size: D.default_30,))
        ],),);
  }
  Widget _introText(){
    return Container(
      width: double.infinity,
      child: Text(tr("send_email_screen_title"),style: S.h3(color:C.GREY_3),textAlign: TextAlign.center,),);

  }
  Widget _titleText(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: D.default_10,bottom:D.default_10),
      child: Text(tr("change_password"),style: S.h1(color:Colors.black),textAlign: TextAlign.center,),);

  }

  Widget _sendButton(){
    return BaseButton(
      onItemClickListener: (){
        if (_loginFormGlobalKey.currentState!.validate()) {
          _loginFormGlobalKey.currentState!.save();
          loginProvider!.getAuthCode(context,_emailController.text);

        }
      },
      title: tr("send"),
      color: C.BLUE_1,
      textStyle: S.h3(color: Colors.white),
      margin: EdgeInsets.all(D.default_5),
    );
  }
  Widget _cancelButton(){
    return BaseButton(
      onItemClickListener: (){
        Navigator.pop(context);
      },
      title: tr("cancel"),
      color: Colors.white,
      enableShadow: false,
      textStyle: S.h3(color: Colors.black),
      margin: EdgeInsets.all(D.default_5),
    );
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
        ],
      ),
    ),);
  }


}
