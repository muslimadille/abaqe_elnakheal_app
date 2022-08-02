import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dio/models/user_data.dart';

class Constants extends Object{
  static String? SELECTED_LANGUAGE="ar";
  static String? LANGUAGE_KEY="LANGUAGE_KEY";
  static   SharedPreferences? prefs ;
  static int OTP_LENGTH=4;
  static String? SAVED_PHONE_KEY="SAVED_PHONE";
  static String? SAVED_EMAIL_KEY="SAVED_EMAIL";
  static String? SAVED_PASSWORD_KEY="SAVED_PASSWORD";
  static String? IS_SOCIAL_LOGIN="IS_SOCIAL_LOGIN";
  static String? SOCIAL_LOGIN_FIRST_NAME="SOCIAL_LOGIN_FIRST_NAME";
  static String? SOCIAL_LOGIN_LAST_NAME="SOCIAL_LOGIN_LAST_NAME";
  static String? SOCIAL_LOGIN_EMAIL="SOCIAL_LOGIN_EMAIL";
  static String? SOCIAL_LOGIN_ID="SOCIAL_LOGIN_ID";
  static String? SOCIAL_LOGIN_PROVIDER="SOCIAL_LOGIN_PROVIDER";
  static String? IS_LOGIN="IS_LOGIN";
  static String? DEVICE_TOKEN="";
  static int? SELECTED_TAB=0;









  static  UserData? currentUser;
  static BuildContext? tabScreenContext;


}