

import 'dart:convert';

import '../../../dio/dio_utils.dart';
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
}