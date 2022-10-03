import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../dio/models/produc_rates_model.dart';
import '../dio/my_responce.dart';
import '../modules/products_screen/data/api_call.dart';
import '../utils/apis.dart';

class RatesProvider with ChangeNotifier{

  ///.....ui controllers.........
  bool isLoading=false;
  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }

  /// ............REGISTER...............
  ProductRatesModel? productRatesModel;
  SearchApi searchApi=SearchApi();
  getProductRates(int productId) async {
    setIsLoading(true);
    MyResponse<ProductRatesModel> response =
    await searchApi.getProductsRates(productId);
    if (response.status == Apis.CODE_SUCCESS &&response.data!=null) {
      productRatesModel = response.data;
      setIsLoading(false);
    }else if(response.status == Apis.CODE_SHOW_MESSAGE ){
      print("getRates error: ${response.msg}");
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }
    notifyListeners();

  }
  setOrderRates(Map<String,dynamic>body,BuildContext context) async {
    setIsLoading(true);
    MyResponse<dynamic> response =
    await searchApi.rateOrder(body);
    if (response.status == Apis.CODE_SUCCESS) {
      await Fluttertoast.showToast(msg: "${response.msg}");
      setIsLoading(false);
      if(Apis.CODE_SHOW_MESSAGE.contains("successfully")){
        Navigator.pop(context);
      }
    }else if(response.status == Apis.CODE_SHOW_MESSAGE ){
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
      if(Apis.CODE_SHOW_MESSAGE.contains("successfully")){
        Navigator.pop(context);
      }
    }
    notifyListeners();

  }
 


}