import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/modules/login_screen/login_screen.dart';
import 'package:abaqe_elnakheal_app/providers/registeration_provider.dart';
import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/res.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_botton.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_text_files.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/input_validation_mixin.dart';
import '../../utils/widgets/loading_widget.dart';
import '../main_tabs_screen/main_tabs_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';



class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({Key? key}) : super(key: key);

  @override
  _RegisterationScreenState createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> with InputValidationMixin{
  final _registerFormGlobalKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _fristNmaeController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _phoneKeyController = TextEditingController();
  RegisterProvider? registerProvider;
  CountryCode? selectedCode;
  int  mobileLength=10;
  String mobileText="";


@override
  void initState() {
    super.initState();
    registerProvider = Provider.of<RegisterProvider>(context, listen: false);
    _phoneNumberController.addListener(() {
      if(_phoneNumberController.text.length>mobileLength){
        setState(() {
          _phoneNumberController.text=mobileText;
        });
      }else{
        mobileText=_phoneNumberController.text;
      }
    });
}



  @override
  Widget build(BuildContext context) {
    registerProvider = Provider.of<RegisterProvider>(context, listen: true);
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
                SizedBox(height: D.default_60,),
                _titleText(),
                _introText(),
                SizedBox(height: D.default_40,),
                _socialLogin(),
                _deviderPart(),
                SizedBox(height: D.default_20,),
                _loginForm(),
                SizedBox(height: D.default_40,),
                _loginButton(),
                _havAccountButton(),
                _skip(),
                SizedBox(height: D.default_60,)
              ],),))
          ],),),
        registerProvider!.isLoading?LoadingProgress():Container()
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
      child: Text(tr("registeration_text"),style: S.h3(color:C.GREY_3),textAlign: TextAlign.center,),);

  }
  Widget _titleText(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: D.default_10,bottom:D.default_10),
      child: Text(tr("register_title"),style: S.h1(color:Colors.black),textAlign: TextAlign.center,),);

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
          /*InkWell(
            onTap:(){},
            child:TransitionImage(
              Res.APPLE_IC,
              width: D.default_50,
              height: D.default_50,
            ),),*/

        ],),
    );
  }

  Widget _loginButton(){
    return BaseButton(
      onItemClickListener: (){
        _onRegisterClicked();
      },
      title: tr("register"),
      color: C.BLUE_1,
      textStyle: S.h3(color: Colors.white),
      margin: EdgeInsets.all(D.default_5),
    );
  }
  Widget _havAccountButton(){
    return BaseButton(
      onItemClickListener: (){
        MyUtils.navigateReplaceCurrent(context, LoginScreen());
      },
      title: tr("have_account_title"),
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
      key: _registerFormGlobalKey,
      child: Column(
        children: [
          BaseTextFiled(
            controller: _emailController,
            hint: tr("email"),
            validator: (name) {
              if (isFieldNotEmpty(name!)) {
                if(isEmailValid(name)){
                  return null;
                }else{
                  return tr("enter_email");
                }
              } else {
                return tr("enter_email");
              }
            },
          ),
          SizedBox(height: D.default_15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Expanded(child: BaseTextFiled(
              controller: _fristNmaeController,
              hint: tr("first_name"),
                validator: (name) {
                  if (isFieldNotEmpty(name!)) {
                    return null;
                  } else {
                    return tr("enter_first_name");
                  }
                }
            )),
            SizedBox(width: D.default_10,),
            Expanded(child: BaseTextFiled(
              controller: _lastNameController,
              hint: tr("last_name"),
                validator: (name) {
                  if (isFieldNotEmpty(name!)) {
                    return null;
                  } else {
                    return tr("enter_last_name");
                  }
                }
            )),
          ],),
          SizedBox(height: D.default_15,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height:D.default_60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(D.default_10),
                  border: Border.all(color: C.GREY_3),
                ),
                child: CountryCodePicker(
                  onChanged: (country){
                    setState(() {
                      selectedCode=country;
                    });
                  },
                  textStyle: S.h4(color: C.GREY_3),
                  dialogTextStyle: S.h2(color: C.GREY_3),
                  padding:EdgeInsets.zero,
                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  initialSelection: 'SA',
                  // optional. Shows only country name and flag
                  showCountryOnly: false,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: false,
                  // optional. aligns the flag and the Text left
                  alignLeft: false,
                ),),
            SizedBox(width:D.default_10),
            Expanded(
              flex:4,
                child: BaseTextFiled(
                controller: _phoneNumberController,
                hint: tr("phone_num"),
                isPassword: false,
                inputType: TextInputType.phone,
                validator: (name) {
                  if (isFieldNotEmpty(name!)) {
                    return null;
                  } else {
                    return tr("enter_phone");
                  }
                }
            ))
          ],),
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
              }
          ),
        ],
      ),
    ),);
  }
  _onRegisterClicked() {
    if (_registerFormGlobalKey.currentState!.validate()) {
      _registerFormGlobalKey.currentState!.save();

      //call register api
      registerProvider!.register(
          context,
          _fristNmaeController.text,
          _lastNameController.text,
          _emailController.text.replaceAll(" ", ""),
          _phoneNumberController.text,
          _passwordController.text);
    }
  }

}
