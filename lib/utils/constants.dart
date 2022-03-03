import 'package:shared_preferences/shared_preferences.dart';

import '../dio/models/user_data.dart';

class Constants extends Object{
  static String? SELECTED_LANGUAGE="ar";
  static String? LANGUAGE_KEY="LANGUAGE_KEY";
  static   SharedPreferences? prefs ;
  static int OTP_LENGTH=4;
  static String? SAVED_PHONE_KEY="SAVED_PHONE";
  static String? SAVED_PASSWORD_KEY="SAVED_PASSWORD";
  static  UserData? currentUser;


}