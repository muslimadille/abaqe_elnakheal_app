import 'dart:convert';

import '../../../dio/dio_utils.dart';
import '../../../dio/models/my_orders_model.dart';
import '../../../dio/my_responce.dart';
import '../../../utils/apis.dart';

class MyOrdersApi{
  Future<MyResponse<MyOrdersModel>> getMyOrders() async {
    final url = "${Apis.MY_ORDERS_API}";
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_GET, url);
    if (response != null && response.statusCode == 200) {
      return MyResponse<MyOrdersModel>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<MyOrdersModel>.init(response!.statusCode.toString(),response.statusMessage!, null);
    }
  }
  Future<MyResponse<dynamic>> cancelOrder(int orderId) async {
    final url = "${Apis.CANCEL_ORDER_API}";
    Map<String,dynamic>body={
      "order_id":orderId
    };
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_POST, url,body: body);
    if (response != null && response.statusCode == 200) {
      return MyResponse<dynamic>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<dynamic>.init(response!.statusCode.toString(),response.statusMessage!, null);
    }
  }

}