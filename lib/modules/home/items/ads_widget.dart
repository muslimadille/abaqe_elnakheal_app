import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: D.default_180,
      margin: EdgeInsets.all(D.default_30),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(D.default_10),
        color: Colors.white,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment:AlignmentDirectional.center,
        fit:StackFit.expand,
        children: [
          Positioned(child: Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: D.default_150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(D.default_10),
                color: C.BLUE_1.withOpacity(0.3),
              )
          ),bottom: -D.default_10,),
          Container(
            width: double.infinity,
            height: D.default_180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(D.default_10),
              color: C.BLUE_1.withOpacity(0.5),
            ),
          ),
          TransitionImage(
            "assets/images/banner_demo_img.png",
            width: double.infinity,
            height: D.default_180,
            fit: BoxFit.cover,
            radius: D.default_15,
          ),
          Container(
            width: double.infinity,
            height: D.default_180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(D.default_10),
              color: C.BLUE_1.withOpacity(0.5),
            ),
          ),
          Container(
            padding: EdgeInsets.all(D.default_20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: D.default_100,
                  height: D.default_30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(D.default_10),
                    color: C.BLUE_1,
                  ),
                  child: Center(child: Text(tr("today_offer"),style: S.h4(color: Colors.white),)),
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("خصم حتي 60%",style: S.h1(color: Colors.white),),
                      Text("علي الأسمدة وكافة المقويات الخاصة بالتربة",style: S.h5(color: Colors.white),)

                    ],)),
                Container(
                  width: D.default_100,
                  height: D.default_35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(D.default_100),
                    color: Colors.white,
                  ),
                  child: Center(child: Text(tr("shop_now"),style: S.h3(color: C.BLUE_1),)),
                ),
              ],
            ),)


        ],),
    );
  }
}
