import 'dart:convert';

import '../../../dio/dio_utils.dart';
import '../../../dio/models/user_data.dart';
import '../../../dio/my_responce.dart';
import '../../../utils/apis.dart';
import '../../../utils/constants.dart';

class RegisterationApi{

  Future<MyResponse<UserData>> register(String firstName,String lastName,String email,String phone,String password,{int regionId=1,int stateId=1}) async {
    final url = "${Apis.REGISTER_API}";
    Map<String,dynamic>body={
      "username":firstName,
      "last_name":lastName,
      "phone":phone,
      "email":email,
      "region_id":regionId,
      "state_id":stateId,
      "password":password,
      "password_confirmation":password,
      "device_token":Constants.DEVICE_TOKEN
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