
import 'package:abaqe_elnakheal_app/modules/main_tabs_screen/main_tabs_screen.dart';
import 'package:abaqe_elnakheal_app/modules/notifications/notifications_screen.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/utils_provider.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/constants.dart';
import '../../utils/my_colors.dart';


class BaseScreen extends StatefulWidget {
  Widget body;
  BaseScreen({required this.body});


  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> with TickerProviderStateMixin{
  UtilsProviderModel? utilsProviderModel;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    /*Connectivity().checkConnectivity().then((ConnectivityResult result) async{
      if(result != ConnectivityResult.none) {
        bool isDeviceConnected = await InternetConnectionChecker().hasConnection;

        utilsProviderModel!.setIsAppConnected(isDeviceConnected);
      }else{
        utilsProviderModel!.setIsAppConnected(false);
      }
    });*/
    utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen: false);
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
      if(result != ConnectivityResult.none) {
        bool isDeviceConnected = await InternetConnectionChecker().hasConnection;

        utilsProviderModel!.setIsAppConnected(isDeviceConnected);
      }else{
        utilsProviderModel!.setIsAppConnected(false);
      }
    });
    InternetConnectionChecker().hasConnection.then((value) {
      utilsProviderModel!.setIsAppConnected(value);
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen: true);
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(children: [
        widget.body,
        !utilsProviderModel!.isAppConnected? Container(width:MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,color: Colors.black.withOpacity(0.6),
          child:_noConnection() ,):Container()
      ],),
      resizeToAvoidBottomInset: true,
    );
  }
  Widget _noConnection(){
    return Center(child: Container(
      width: D.default_250,
      height: D.default_250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(D.default_15),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Lottie.asset(
            "assets/lottie/no_signal_lottie.json",
            width: D.default_150,
            height: D.default_150,
            alignment: Alignment.center
        ),
        Text(tr("no_connection"),style: S.h4(color: C.GREY_3),),
          SizedBox(height: D.default_20,)
      ],),
    ),);
  }

}
