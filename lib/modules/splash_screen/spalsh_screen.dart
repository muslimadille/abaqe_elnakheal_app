import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/modules/splash_screen/on_boarding_screen.dart';
import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/res.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/login_provider.dart';
import '../../providers/regions_provider.dart';
import '../../providers/utils_provider.dart';
import '../../utils/constants.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? prefs;
  LoginProvider?loginProvider;
  RegionsProvider? regionsProvider;
  UtilsProviderModel?utilsProviderModel;


  @override
  void initState() {
    super.initState();
    utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen:false);
    regionsProvider=Provider.of<RegionsProvider>(context,listen: false);
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    regionsProvider!.getRegions();
    _initPref(context);

  }
  @override
  Widget build(BuildContext context) {
    regionsProvider=Provider.of<RegionsProvider>(context,listen: true);
    loginProvider = Provider.of<LoginProvider>(context, listen: true);
    utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen:false);

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
     String local= await Constants.prefs!.get(Constants.LANGUAGE_KEY!)!=null?Constants.prefs!.get(Constants.LANGUAGE_KEY!).toString():"ar";
     if(local=="ar"){
       utilsProviderModel!.setCurrentLocal(ctx, Locale('ar', 'EG'));
     }else{
       utilsProviderModel!.setCurrentLocal(ctx, Locale('en', 'US'));
     }
    _initSavedUser();

  }
  _initSavedUser(){
    if( Constants.prefs!.get(Constants.SAVED_PHONE_KEY!)!=null&&Constants.prefs!.get(Constants.SAVED_PHONE_KEY!).toString().isNotEmpty&&Constants.prefs!.get(Constants.SAVED_PASSWORD_KEY!)!=null){
      loginProvider!.login(context,Constants.prefs!.get(Constants.SAVED_PHONE_KEY!).toString(),Constants.prefs!.get(Constants.SAVED_PASSWORD_KEY!).toString());
    }
  }
}
