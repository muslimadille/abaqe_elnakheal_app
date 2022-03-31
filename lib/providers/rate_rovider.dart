import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../dio/models/home_model.dart';
import '../dio/models/produc_rates_model.dart';
import '../dio/my_responce.dart';
import '../modules/home/data/home_api_helper.dart';
import '../modules/products_screen/data/api_call.dart';
import '../modules/search/search_model.dart';
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
 


}