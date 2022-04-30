import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../dio/my_responce.dart';
import '../modules/notifications/data/notification_api.dart';
import '../modules/notifications/data/notification_model.dart';
import '../utils/apis.dart';

class NotificationsProvider with ChangeNotifier{

  ///.....ui controllers.........
  bool isLoading=false;
  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }
  NotificationsApi?notificationsApi=NotificationsApi();
  NotificationModel? notificationModel;
  getNotifications() async {
    setIsLoading(true);
    MyResponse<NotificationModel> response =
    await notificationsApi!.getNotifications();
    if (response.status == Apis.CODE_SUCCESS &&response.data!=null) {
      notificationModel = response.data;
      notifyListeners();
      setIsLoading(false);
    }else if(response.status == Apis.CODE_SHOW_MESSAGE ){
      print("RegionsApi error: ${response.msg}");
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }
    notifyListeners();
  }

}