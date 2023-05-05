import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/modules/splash_screen/on_boarding_screen.dart';
import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/res.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/login_provider.dart';
import '../../providers/regions_provider.dart';
import '../../providers/utils_provider.dart';
import '../../utils/base_text_style.dart';
import '../../utils/constants.dart';
import '../../utils/my_colors.dart';


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
  bool loadingFinish=false;


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
    loginProvider = Provider.of<LoginProvider>(context, listen: true);
    //utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen:true);
    return BaseScreen(body: Stack(
      alignment:AlignmentDirectional.center,
      children: [
        /*TransitionImage(Res.SPLASH_BG,fit: BoxFit.cover,
          width: double.infinity,height: double.infinity,),*/
        Center(child: TransitionImage(
          Res.SPLASH_LOGO,
          fit: BoxFit.fitWidth,
          width: D.default_300,
          height: D.default_300,
        ),),
        Container(
          margin: EdgeInsets.only(top: D.default_300),
          child: SpinKitCircle(
          color: C.BLUE_1,
          size: D.default_50,
        ),),
        Positioned(child: Text("V 0.0.1",style: S.h4(color: C.GREY_3),),bottom: D.default_20,)


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
     /*String local= await Constants.prefs!.get(Constants.LANGUAGE_KEY!)!=null?Constants.prefs!.get(Constants.LANGUAGE_KEY!).toString():"ar";
     if(local=="ar"){
       utilsProviderModel!.setCurrentLocal(ctx, Locale('ar', 'EG'));
     }else{
       utilsProviderModel!.setCurrentLocal(ctx, Locale('en', 'US'));
     }*/
     checkLogin();

  }

  void checkLogin()async{
    bool? isLogin= await prefs?.getBool(Constants.IS_LOGIN!)??false;
    if(isLogin){
      bool?isSocial=await prefs?.getBool(Constants.IS_SOCIAL_LOGIN!)??false;
      if(isSocial){
        Map<String,dynamic>body ={
          "username":await prefs?.getString(Constants.SOCIAL_LOGIN_FIRST_NAME!),
          "last_name":await prefs?.getString(Constants.SOCIAL_LOGIN_LAST_NAME!),
          "userId":await prefs?.getString(Constants.SOCIAL_LOGIN_ID!),
          "email":await prefs?.getString(Constants.SOCIAL_LOGIN_EMAIL!),
          "device_token":Constants.DEVICE_TOKEN,
          "avatar":"",
          "provider":"google"
        };
        print(body.toString());
        loginProvider!.socialLogin(context,body);
      }else{
        String? email=await Constants.prefs!.getString(Constants.SAVED_EMAIL_KEY!)??"";
        String? password=await Constants.prefs!.getString(Constants.SAVED_PASSWORD_KEY!)??"";
        loginProvider!.login(context,email,password);
      }
    }else{
      _timerNavigation();
    }
  }
}
