import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_botton.dart';
import 'package:flutter/material.dart';

import '../../utils/baseDimentions.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(D.default_20),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        SizedBox(height: D.default_20,),
        Text("اللغة العربية",style: S.h2(color: C.BLUE_1),),
        SizedBox(height: D.default_10,),
        Container(height: D.default_1,color: C.GREY_5,),
          SizedBox(height: D.default_10,),
          Text("English US",style: S.h2(color: C.GREY_1),),
        SizedBox(height: D.default_20,),
        BaseButton(onItemClickListener: (){}, title: "حفظ التغييرات"),

      ],)
    );
  }
}
