import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets/base_botton.dart';
import '../../utils/widgets/base_text_files.dart';
import '../../utils/widgets/transition_image.dart';
import '../home/items/card_icon.dart';
import '../login_screen/item/back_btn_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _loginFormGlobalKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _fristNmaeController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseScreen(body: SafeArea(child: Column(children: [
      _header(context),
      Container(
        padding: EdgeInsets.all(D.default_20),
        child: Column(children: [
          SizedBox(height: D.default_20,),
          _loginForm(),
        SizedBox(height: D.default_20,),
        _loginButton()
      ],),)


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
          Expanded(child: Text("تغيير كلمة المرور",style: S.h1(color: C.GREY_1),textAlign: TextAlign.center,)),
          CardIconWidget(),

        ],),);

  }




  Widget _loginButton(){
    return BaseButton(
      onItemClickListener: (){},
      title: "تغيير كلمة السر",
      color: C.BLUE_1,
      textStyle: S.h3(color: Colors.white),
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
            hint: "كلمة السر القديمة",
            isPassword: true,
          ),
          SizedBox(height: D.default_15,),
          BaseTextFiled(
            controller: _fristNmaeController,
            hint: "كلمة السر الجديدة",
            isPassword: true,
          ),
          SizedBox(height: D.default_15,),
          BaseTextFiled(
            controller: _passwordController,
            hint:"تأكيد كلمة السر",
            isPassword: true,
          ),

        ],
      ),
    ),);
  }

}
