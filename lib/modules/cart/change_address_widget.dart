import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/modules/login_screen/login_screen.dart';
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
import 'package:lottie/lottie.dart';

import '../main_tabs_screen/main_tabs_screen.dart';

class ChangeAddresWidget extends StatefulWidget {
  const ChangeAddresWidget({Key? key}) : super(key: key);

  @override
  _ChangeAddresWidgetState createState() => _ChangeAddresWidgetState();
}

class _ChangeAddresWidgetState extends State<ChangeAddresWidget> {
  final _loginFormGlobalKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _fristNmaeController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(left: D.default_40,right: D.default_40),
      width: double.infinity,
      child: Column(children: [
        Expanded(child: SingleChildScrollView(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image(),
            Center(child: Text("اضافة عنوان جديد",style: S.h1(color: C.GREY_1),),),
            Center(child: Text("سيتم حفظ بيانات هذا العنوان للمره القادمة",style: S.h3(color: C.GREY_3),),),
            SizedBox(height: D.default_20,),
            _loginForm(),
            SizedBox(height: D.default_40,),
            _DoneButton(),
            SizedBox(height: D.default_60,)
          ],),))
      ],),);
  }
  Widget _image(){
    return Center(child: Lottie.asset(
        "assets/lottie/address_img.json",
        width: D.default_160,
        height:D.default_160,
        alignment: Alignment.center
    ));
  }
  Widget _DoneButton(){
    return BaseButton(
      onItemClickListener: (){
        Navigator.pop(context);
      },
      title:"حفظ العنوان",
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
            hint:"الاسم بالكامل",
          ),
          SizedBox(height: D.default_15,),
          Row(children: [
            Expanded(child: BaseTextFiled(
              controller: _fristNmaeController,
              hint: "المحافظة",
            )),
            SizedBox(width: D.default_10,),
            Expanded(child: BaseTextFiled(
              controller: _lastNameController,
              hint: "المدينة",
            )),
          ],),
          SizedBox(height: D.default_15,),
          BaseTextFiled(
            controller: _phoneNumberController,
            hint: "العنوان",
            isPassword: false,
            inputType: TextInputType.phone,
          ),
          SizedBox(height: D.default_15,),
          BaseTextFiled(
            controller: _passwordController,
            hint: "ملاحظات أخري",
            isPassword: false,
          ),
        ],
      ),
    ),);
  }
}
