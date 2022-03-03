import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/modules/splash_screen/on_boarding_screen.dart';
import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/res.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    _initPref(context);
  }
  @override
  Widget build(BuildContext context) {
    _timerNavigation();
    return BaseScreen(body: Stack(
      alignment:AlignmentDirectional.center,
      children: [
        TransitionImage(Res.SPLASH_BG,fit: BoxFit.cover,
          width: double.infinity,height: double.infinity,),
        TransitionImage(
          Res.SPLASH_LOGO,
          fit: BoxFit.fitWidth,
          width: D.default_100,
          height: D.default_100,
        )


      ],
    ));
  }
  void _timerNavigation(){
    Future.delayed(Duration(milliseconds: 5000)).then((value) {
      MyUtils.navigateReplaceCurrent(context, OnBoardingScreen());
    });
    
  }
  void _initPref(BuildContext ctx)async{
    prefs =  await SharedPreferences.getInstance();
    Constants.prefs=prefs;


  }
}
