import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../dio/models/home_model.dart';
import '../dio/my_responce.dart';
import '../modules/home/data/home_api_helper.dart';
import '../utils/apis.dart';

class HomeProvider with ChangeNotifier{

  ///.....ui controllers.........
  bool isLoading=false;
  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }

  /// ............REGISTER...............
  HomeModel? homeData;
  HomeApi homeApi=HomeApi();
  getHomeData() async {
    setIsLoading(true);
    MyResponse<HomeModel> response =
    await homeApi.getHomeData();
    if (response.status == Apis.CODE_SUCCESS &&response.data!=null) {
      HomeModel data = response.data;
      setHomeData(data);
      setIsLoading(false);
    }else if(response.status == Apis.CODE_SHOW_MESSAGE ){
      print("login error: ${response.msg}");
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }
    notifyListeners();

  }
  setHomeData(HomeModel data){
    homeData=data;
    notifyListeners();
  }


}