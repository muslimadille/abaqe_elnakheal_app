import 'dart:convert';

import '../../../dio/dio_utils.dart';
import '../../../dio/models/user_data.dart';
import '../../../dio/my_responce.dart';
import '../../../utils/apis.dart';

class HomeApi{

  Future<MyResponse<UserData>> getHomeData() async {
    final url = "${Apis.HOME_API}";

    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_GET, url);
    if (response != null && response.statusCode == 200) {
      return MyResponse<UserData>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<UserData>.init(response!.statusCode.toString(),response.statusMessage!, null);
    }
  }
}