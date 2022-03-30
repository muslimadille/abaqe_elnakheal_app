import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../dio/models/my_orders_model.dart';
import '../dio/my_responce.dart';
import '../modules/my_orders_screen/data/my_orders_api.dart';
import '../utils/apis.dart';

class MyordersProvider with ChangeNotifier{

  ///.....ui controllers.........
  bool isLoading=false;
  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }


  /// ............my orders...............
  MyOrdersModel? myOrders;
  List<OrderData>? currentOrdersList=[];
  List<OrderData>? previousOrdersList=[];
  MyOrdersApi myOrdersApi=MyOrdersApi();
  getMyOrders() async {
    setIsLoading(true);
    MyResponse<MyOrdersModel> response =
    await myOrdersApi.getMyOrders();
    if (response.status == Apis.CODE_SUCCESS &&response.data!=null) {
      myOrders = response.data;
      setOredrs(myOrders!.orders!.data!);
      setIsLoading(false);
    }else if(response.status == Apis.CODE_SHOW_MESSAGE ){
      print("RegionsApi error: ${response.msg}");
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }
    notifyListeners();
  }
  setOredrs(List<OrderData> data){
    previousOrdersList!.clear();
    currentOrdersList!.clear();
    for(int i=0;i<data.length;i++){
      if(data[i].status!=5&&data[i].status!=7){
        currentOrdersList!.add(data[i]);
      }else{
        previousOrdersList!.add(data[i]);
      }
    }
    notifyListeners();
  }
}