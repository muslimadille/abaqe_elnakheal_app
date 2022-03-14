import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../dio/models/home_model.dart';
import '../dio/my_responce.dart';
import '../modules/home/data/home_api_helper.dart';
import '../modules/products_screen/data/api_call.dart';
import '../modules/search/search_model.dart';
import '../utils/apis.dart';

class SearchProvider with ChangeNotifier{

  ///.....ui controllers.........
  bool isLoading=false;
  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }

  /// ............REGISTER...............
  SearchModel? searchModel;
  SearchApi searchApi=SearchApi();
  search({int? categoryId, String? searchKey}) async {
    setIsLoading(true);
    MyResponse<SearchModel> response =
    await searchApi.search(categoryId: categoryId,searchKey:searchKey);
    if (response.status == Apis.CODE_SUCCESS &&response.data!=null) {
      SearchModel data = response.data;
      setHomeData(data);
      setIsLoading(false);
    }else if(response.status == Apis.CODE_SHOW_MESSAGE ){
      print("search error: ${response.msg}");
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }
    notifyListeners();

  }
  setHomeData(SearchModel data){
    searchModel=data;
    notifyListeners();
  }


}