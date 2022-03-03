import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../dio/models/user_data.dart';
import '../dio/my_responce.dart';
import '../modules/main_tabs_screen/main_tabs_screen.dart';
import '../modules/otp/use_code_screen.dart';
import '../modules/registeration/data/register_api_handler.dart';
import '../utils/apis.dart';
import '../utils/constants.dart';
import '../utils/myUtils.dart';

class RegisterProvider with ChangeNotifier{

  ///.....ui controllers.........
  bool isLoading=false;
  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }

  /// ............REGISTER...............
  UserData? currentUser;
  RegisterationApi registerationApi=RegisterationApi();
  register(BuildContext ctx,String firstName,String lastName,String email,String phone,String password,{int regionId=1,int stateId=1}) async {
    setIsLoading(true);
    MyResponse<UserData> response =
    await registerationApi.register(  firstName, lastName, email, phone, password, regionId:regionId, stateId:stateId);
    if (response.status == Apis.CODE_SUCCESS &&response.data!=null){
      UserData user=response.data;
      setCurrentUserData(user);
      await Constants.prefs!.setString(Constants.SAVED_PHONE_KEY!,phone);
      await Constants.prefs!.setString(Constants.SAVED_PASSWORD_KEY!,password);
      setIsLoading(false);
      MyUtils.navigate(ctx, MainTabsScreen());

      //MyUtils.navigateReplaceCurrent(ctx, OtpScreen("register",tr('register_otp'),code:response.code.toString(),));
    }else if(response.status == Apis.CODE_ACTIVE_USER &&response.data!=null){
      UserData user=response.data;
      setCurrentUserData(user);
      setIsLoading(false);
      MyUtils.navigate(ctx, MainTabsScreen());

      //MyUtils.navigateReplaceCurrent(ctx, OtpScreen("register",tr('register_otp'),code:response.code.toString(),));
    }else if(response.status == Apis.CODE_SHOW_MESSAGE ){
      print("login error: ${response.msg}");
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }
    notifyListeners();

  }
  setCurrentUserData(UserData user){
    currentUser=user;
    Constants.currentUser=user;
    Apis.TOKEN_VALUE=user.token!;
    notifyListeners();
  }


}