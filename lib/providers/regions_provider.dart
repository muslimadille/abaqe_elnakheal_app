import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../dio/models/addressModel.dart';
import '../dio/models/region_model.dart';
import '../dio/models/state_model.dart';
import '../dio/my_responce.dart';
import '../modules/regions/regions_api.dart';
import '../utils/apis.dart';
import 'cart_provider.dart';

class RegionsProvider with ChangeNotifier{
  List<AddressModel> addressList=[];

  ///.....ui controllers.........
  bool isLoading=false;
  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }


  /// ............regions...............
  List<RegionsModel> regions=[];
  RegionsApi regionsApi=RegionsApi();
  getRegions() async {
    setIsLoading(true);
    MyResponse<List<RegionsModel>> response =
    await regionsApi.getRegions();
    if (response.status == Apis.CODE_SUCCESS &&response.data!=null) {
      List<RegionsModel> data = response.data;
      setRegionsData(data);
      setIsLoading(false);
    }else if(response.status == Apis.CODE_SHOW_MESSAGE ){
      print("RegionsApi error: ${response.msg}");
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }
    notifyListeners();
  }
  setRegionsData(List<RegionsModel> data){
    regions=data;
    notifyListeners();
  }
  addAddress(BuildContext context,String name,String address,String note,int regionId,int stateId,CartProvider cartProvider) async {
    setIsLoading(true);
    MyResponse<List<AddressModel>> response =
    await regionsApi.addAddress( name, address, note, regionId, stateId);

    if (response.status == Apis.CODE_SUCCESS &&response.data!=null) {
      List<AddressModel> data = response.data;
      addressList.addAll(data);
      cartProvider.getCartItems();
      setIsLoading(false);
      Navigator.pop(context);
      if(response.msg!.isNotEmpty){await Fluttertoast.showToast(msg: "${response.msg}");}
    }else if(response.status == Apis.CODE_SHOW_MESSAGE ){
      Navigator.pop(context);
      print("login error: ${response.msg}");
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }
    notifyListeners();

  }



}