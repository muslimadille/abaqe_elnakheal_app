

import 'dart:convert';

import '../../../dio/dio_utils.dart';
import '../../../dio/models/authCodeModel.dart';
import '../../../dio/models/user_data.dart';
import '../../../dio/my_responce.dart';
import '../../../utils/apis.dart';

class LoginApi{

  Future<MyResponse<UserData>> login(String phone,String password) async {
    final url = "${Apis.LOGIN_API}";
    Map<String,dynamic>body={
      "email":phone,
      "password":password
    };
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_POST, url,body: body);
    if (response != null && response.statusCode == 200) {
      return MyResponse<UserData>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<UserData>.init(response!.statusCode.toString(),response.statusMessage!, null);
    }
  }
  Future<MyResponse<AuthCodeModel>> getAuthCode(String email) async {
    final url = "${Apis.GET_AUTH_CODE_API}";
    Map<String,dynamic>body={
      "email":email,
    };
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_POST, url,body: body);
    if (response != null && response.statusCode == 200) {
      return MyResponse<AuthCodeModel>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<AuthCodeModel>.init(response!.statusCode.toString(),response.statusMessage!, null);
    }
  }
  Future<MyResponse<dynamic>> setNewPassword(String email,String code,String password, String confPassword) async {
    final url = "${Apis.SET_NEW_PASSWORD_API}";
    Map<String,dynamic>body={
      "email":email,
      "activation_code":code,
      "password":password,
      "password_confirmation":confPassword
    };
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_POST, url,body: body);
    if (response != null && response.statusCode == 200) {
      return MyResponse<dynamic>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<dynamic>.init(response!.statusCode.toString(),response.statusMessage!, null);
    }
  }
  Future<MyResponse<UserData>> editProfile(Map<String,dynamic>userData) async {
    final url = "${Apis.UPDATE_PROFILE_API}";
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_POST, url,body: userData);
    if (response != null && response.statusCode == 200) {
      return MyResponse<UserData>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<UserData>.init(response!.statusCode.toString(),response.statusMessage!, null);
    }
  }
}