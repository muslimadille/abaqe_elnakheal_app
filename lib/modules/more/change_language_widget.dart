import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_botton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/utils_provider.dart';
import '../../utils/baseDimentions.dart';

class ChangeLanguageWidget extends StatefulWidget {
  const ChangeLanguageWidget({Key? key}) : super(key: key);

  @override
  State<ChangeLanguageWidget> createState() => _ChangeLanguageWidgetState();
}

class _ChangeLanguageWidgetState extends State<ChangeLanguageWidget> {
  UtilsProviderModel? utilsProviderModel;
  @override
  void initState() {
    super.initState();
    utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen: false);
  }
  @override
  Widget build(BuildContext context) {
    utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen: false);
    return Container(
      padding: EdgeInsets.all(D.default_20),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        SizedBox(height: D.default_20,),
          _arabicBtn(),
        SizedBox(height: D.default_10,),
        Container(height: D.default_1,color: C.GREY_5,),
          SizedBox(height: D.default_10,),
          _englishBtn(),
        SizedBox(height: D.default_20,),
        BaseButton(onItemClickListener: (){}, title: "حفظ التغييرات"),

      ],)
    );
  }

  Widget _englishBtn(){
    return InkWell(
      onTap: (){
        utilsProviderModel!.setCurrentLocal(context,Locale('en', 'US'));
      },
      child: Text("English US",style: S.h2(color: utilsProviderModel!.isArabic?C.GREY_1:C.BLUE_1),),
    );
  }

  Widget _arabicBtn(){
    return InkWell(
      onTap: (){
        utilsProviderModel!.setCurrentLocal(context,Locale('ar', 'EG'));

      },
      child: Text("اللغة العربية",style: S.h2(color: utilsProviderModel!.isArabic?C.BLUE_1:C.GREY_1),),);
  }
}
