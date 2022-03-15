import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../dio/models/add_to_cart_model.dart';
import '../dio/models/addressModel.dart';
import '../dio/models/coupon_model.dart';
import '../dio/models/my_cart_model.dart';
import '../dio/my_responce.dart';
import '../modules/cart/data/cart_api_provider.dart';
import '../utils/apis.dart';

class CartProvider with ChangeNotifier{

  ///.....ui controllers.........
  int clickedIndex=0;
  bool isLoading=false;
  double couponCost=0;
  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }
  void setClickedIndex(int value){
    clickedIndex=value;
    notifyListeners();
  }


  /// ............add to cart...............
  CartApiProvider cartApiProvider=CartApiProvider();
  AddToCartModel? cartCount;
  addToCart(int product_id,int quantity,{bool hideLoading=false}) async {
    if(!hideLoading)setIsLoading(true);
    MyResponse<AddToCartModel> response =
    await cartApiProvider.addToCart(product_id, quantity);
    if (response.status == Apis.CODE_SUCCESS &&response.data!=null) {
      AddToCartModel data = response.data;
      setHomeData(data);
      setIsLoading(false);
      if(response.msg!.isNotEmpty){await Fluttertoast.showToast(msg: "${response.msg}");}
      updateCartItems();
    }else if(response.status == Apis.CODE_SHOW_MESSAGE ){
      print("login error: ${response.msg}");
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }
    notifyListeners();

  }
  setHomeData(AddToCartModel data){
    cartCount=data;
    notifyListeners();
  }
  ///.............GET CART ITEMS.................
  MyCartModel? myCartModel;
  getCartItems() async {
    setIsLoading(true);
    MyResponse<MyCartModel> response =
    await cartApiProvider.getCartItems();
    if (response.status == Apis.CODE_SUCCESS &&response.data!=null) {
      MyCartModel data = response.data;
      setCartItemsData(data);
      setIsLoading(false);
      if(response.msg!.isNotEmpty){await Fluttertoast.showToast(msg: "${response.msg}");}
    }else if(response.status == Apis.CODE_SHOW_MESSAGE ){
      print("login error: ${response.msg}");
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }
    notifyListeners();

  }
  updateCartItems() async {
    MyResponse<MyCartModel> response =
    await cartApiProvider.getCartItems();
    if (response.status == Apis.CODE_SUCCESS &&response.data!=null) {
      MyCartModel data = response.data;
      setCartItemsData(data);
      setIsLoading(false);
      if(response.msg!.isNotEmpty){await Fluttertoast.showToast(msg: "${response.msg}");}
    }else if(response.status == Apis.CODE_SHOW_MESSAGE ){
      print("login error: ${response.msg}");
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }
    notifyListeners();

  }
  setCartItemsData(MyCartModel data){
    myCartModel=data;
    couponCost=0;
    notifyListeners();
  }
  ///..............COUPON.............................
  getCoupon(BuildContext context,String code) async {
    setIsLoading(true);
    MyResponse<CouponModel> response =
    await cartApiProvider.getCoupon(code);
    if (response.status == Apis.CODE_SUCCESS &&response.data!=null) {
      CouponModel data = response.data;
      couponCost=data.money!.toDouble();
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