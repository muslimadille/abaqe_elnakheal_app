import 'dart:convert';
import '../../../dio/dio_utils.dart';
import '../../../dio/my_responce.dart';
import '../../../utils/apis.dart';
import 'notification_model.dart';

class NotificationsApi{

  Future<MyResponse<NotificationModel>> getNotifications() async {
    final url = "${Apis.NOTIFICATIONS}";
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_GET, url);
    if (response != null && response.statusCode == 200) {
      return MyResponse<NotificationModel>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<NotificationModel>.init(response!.statusCode.toString(),response.statusMessage!, null);
    }
  }
}