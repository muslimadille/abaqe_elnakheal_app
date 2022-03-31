import 'package:abaqe_elnakheal_app/modules/login_screen/data/login_api.dart';
import 'package:abaqe_elnakheal_app/modules/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../dio/models/authCodeModel.dart';
import '../dio/models/user_data.dart';
import '../dio/my_responce.dart';
import '../modules/main_tabs_screen/main_tabs_screen.dart';
import '../modules/otp/use_code_screen.dart';
import '../modules/splash_screen/spalsh_screen.dart';
import '../utils/apis.dart';
import '../utils/constants.dart';
import '../utils/myUtils.dart';

class LoginProvider with ChangeNotifier{

  ///.....ui controllers.........
  bool isLoading=false;
  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }

  /// ............REGISTER...............
  UserData? currentUser;
  LoginApi loginApi=LoginApi();
  login(BuildContext ctx,String phone,String password) async {
    setIsLoading(true);
    MyResponse<UserData> response =
    await loginApi.login(  phone, password);
    if (response.status == Apis.CODE_SUCCESS &&response.data!=null){
      UserData user=response.data;
      setCurrentUserData(user);
      await Constants.prefs!.setString(Constants.SAVED_PHONE_KEY!,phone);
      await Constants.prefs!.setString(Constants.SAVED_PASSWORD_KEY!,password);
      setIsLoading(false);
      MyUtils.navigateAsFirstScreen(ctx, MainTabsScreen());
    }else if(response.status == Apis.CODE_ACTIVE_USER &&response.data!=null){
      UserData user=response.data;
      setCurrentUserData(user);
      setIsLoading(false);
      MyUtils.navigateAsFirstScreen(ctx, MainTabsScreen());
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

  getAuthCode(BuildContext ctx,String email) async {
    setIsLoading(true);
    MyResponse<AuthCodeModel> response =
    await loginApi.getAuthCode(email);
    if (response.status == Apis.CODE_SUCCESS) {
      //AuthCodeModel user=response.data;
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
      MyUtils.navigate(
          ctx, OtpScreen("SendOtpEmailScreen", "SendOtpEmailScreen",email: email,code:"" ,));
    }
    else if(response.status == Apis.CODE_SHOW_MESSAGE ){
      print("otp error: ${response.msg}");
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }
    notifyListeners();

  }
  setNewPassword(BuildContext ctx,String email,String code,String password, String confPassword) async {
    setIsLoading(true);
    MyResponse<dynamic> response =
    await loginApi.setNewPassword( email, code, password,  confPassword);
    if (response.status == Apis.CODE_SUCCESS) {
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
      MyUtils.navigateAsFirstScreen(ctx, LoginScreen());
    }
    else if(response.status == Apis.CODE_SHOW_MESSAGE ){
      print("otp error: ${response.msg}");
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }
    notifyListeners();

  }
  /// edit profile
  editProfile(Map<String,dynamic> userData) async {
    setIsLoading(true);
    MyResponse<UserData> response =
    await loginApi.editProfile(userData);
    if (response.status == Apis.CODE_SUCCESS &&response.data!=null){
      UserData user=response.data;
      setCurrentUserData(user);
      //await Constants.prefs!.setString(Constants.SAVED_PHONE_KEY!,phone);
      //await Constants.prefs!.setString(Constants.SAVED_PASSWORD_KEY!,password);
      setIsLoading(false);
      MyUtils.navigateAsFirstScreen(Constants.tabScreenContext!, SplashScreen());
    }else if(response.status == Apis.CODE_ACTIVE_USER &&response.data!=null){
      UserData user=response.data;
      setCurrentUserData(user);
      setIsLoading(false);
      MyUtils.navigateAsFirstScreen(Constants.tabScreenContext!, SplashScreen());
    }else if(response.status == Apis.CODE_SHOW_MESSAGE ){
      print("login error: ${response.msg}");
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }
    notifyListeners();

  }

}