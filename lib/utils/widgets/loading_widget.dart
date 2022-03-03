import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../baseDimentions.dart';
import '../my_colors.dart';

class LoadingProgress extends StatelessWidget {
  const LoadingProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      width: double.infinity,
      height: double.infinity,
      child:Center(child: Container(
        margin: EdgeInsets.all(D.default_60),
        width: double.infinity,
        height: D.default_80,
        padding: EdgeInsets.all(D.default_15),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(D.default_5)),
        ),
        child:  Row(children: [
          SpinKitCircle(
            color: C.BLUE_1,
            size: D.default_40,
          ),
          SizedBox(width: D.default_10,),
          Text(tr("loading"),style: S.h4(color: C.BLUE_1),)
        ],),),) ,
    );
  }
}
