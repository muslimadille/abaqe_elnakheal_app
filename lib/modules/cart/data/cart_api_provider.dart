import 'dart:convert';

import '../../../dio/dio_utils.dart';
import '../../../dio/models/add_order_model.dart';
import '../../../dio/models/add_to_cart_model.dart';
import '../../../dio/models/addressModel.dart';
import '../../../dio/models/coupon_model.dart';
import '../../../dio/models/my_cart_model.dart';
import '../../../dio/my_responce.dart';
import '../../../utils/apis.dart';
import 'package:dio/dio.dart';


class CartApiProvider{

  Future<MyResponse<AddToCartModel>> addToCart(int product_id,int quantity) async {
    final url = Apis.ADD_TO_CART_API;
    Map<String,dynamic>body={
      "product_id":product_id,
      "quantity":quantity
    };
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_POST, url,body: body);
    if (response != null && response.statusCode == 200) {
      return MyResponse<AddToCartModel>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<AddToCartModel>.init(response!.statusCode.toString(),response.statusMessage!, null);
    }
  }
  Future<MyResponse<MyCartModel>> getCartItems() async {
    final url = Apis.GET_CART_ITEMS_API;
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_GET, url);
    if (response != null && response.statusCode == 200) {
      return MyResponse<MyCartModel>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<MyCartModel>.init(response!.statusCode.toString(),response.statusMessage!, null);
    }
  }
  Future<MyResponse<CouponModel>> getCoupon(String code) async {
    Map<String,String>body={
      "code":"$code"
    };
    final url = Apis.GET_COUPON_API;
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_POST, url,body: body);
    if (response != null && response.statusCode == 200) {
      return MyResponse<CouponModel>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<CouponModel>.init(response!.statusCode.toString(),response.statusMessage!, null);
    }
  }

  Future<MyResponse<AddOrderModel>> addOrder(FormData body) async {
    final url = Apis.ADD_ORDER_API;

    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_POST, url,body: body);
    if (response != null && response.statusCode == 200) {
      return MyResponse<AddOrderModel>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<AddOrderModel>.init(response!.statusCode.toString(),response.statusMessage!, null);
    }
  }

}