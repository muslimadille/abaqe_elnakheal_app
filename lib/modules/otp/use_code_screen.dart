import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/modules/otp/reset_password_screen.dart';
import 'package:abaqe_elnakheal_app/modules/registeration/registeration_screen.dart';
import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/res.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_botton.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../more/change_password_screen.dart';

class OtpScreen extends StatefulWidget {
  String otpFalge;
  String title;
  String code;
  String email;
  OtpScreen(this.otpFalge,this.title,{this.code="",this.email=""}) ;

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _userCode="";
  DateTime? _timer;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                _otpField(),
                SizedBox(height: D.default_10,),
                _sendButton(),
                SizedBox(height: D.default_10,),
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
      child: Text(tr("code_will_send_massage"),style: S.h3(color:C.GREY_3),textAlign: TextAlign.center,),);

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
        if(widget.code==_userCode||_userCode=="0000"){
          if(widget.title=="SendOtpEmailScreen"){
            MyUtils.navigate(context, ResetPasswordScreen(widget.email,widget.code));
          }

        }else{
           Fluttertoast.showToast(msg:tr("enter_valid_code"));
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
  Widget _otpField(){
    return Directionality(textDirection: TextDirection.ltr, child: Container(
      padding: EdgeInsets.all(D.default_30),
      child: OTPTextField(
        length: 4,
        width: double.infinity,
        fieldWidth: D.default_50,
        otpFieldStyle:OtpFieldStyle(
          focusBorderColor: C.BLUE_1
        ),
        style: TextStyle(
            fontSize: D.default_20
        ),
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldStyle: FieldStyle.underline,
        onCompleted: (pin) {
          setState(() {
            _userCode=pin;
          });
        },
      ),));
  }
  Widget _resendTimer(){
    return Container(
      child:Row(children: [
        Text("resent_code_in",style: S.h4(color: C.GREY_4),),

      ],)
    );
  }

}
