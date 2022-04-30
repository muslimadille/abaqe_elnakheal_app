

import '../modules/notifications/data/notification_model.dart';
import '../modules/search/search_model.dart';
import 'models/add_order_model.dart';
import 'models/add_to_cart_model.dart';
import 'models/addressModel.dart';
import 'models/authCodeModel.dart';
import 'models/coupon_model.dart';
import 'models/home_model.dart';
import 'models/my_cart_model.dart';
import 'models/my_orders_model.dart';
import 'models/produc_rates_model.dart';
import 'models/region_model.dart';
import 'models/user_data.dart';

class MyResponse<T> extends Object {
  final TAG = "MyResponse";

  String? _status = "";
  String? _msg = "";
  var _data;
  int?_activation_code;

  MyResponse.fromJson(Map<String, dynamic> json) {
    print("$TAG: ${json.toString()}");
    if (json.containsKey("activation_code")) {
      _activation_code = json['activation_code'];
    }
    if (json.containsKey("status")) {
      _status = json['status'].toString();
    }
    if (json.containsKey("Error")) {
      _msg = json['Error'];
    } else if (json.containsKey("error")) {
      _msg = json['error'];
    }
    if (json.containsKey("message")) {
      _msg = json['message'];
    }
    if (json.containsKey("Data")) {
      if(_status=="400"){
        _data=null;
      }else{
        _checkType(json['Data']);
      }
    } else if (json.containsKey("data")) {
      if(_status=="400"){
        _data=null;
      }else{
        _checkType(json['data']);
      }    }


  }

  MyResponse.init(String status, String msg, dynamic data, {int? code}) {
    _status = status;
    _msg = msg;
    _activation_code=code;
    if (data is int) {
      _status = "$data";
    } else {
      _data = data;
    }

  }

  _checkType(json) {
    print("$TAG-T_Type: $T");

    if (json != null) {
      if (!_parseList(json)) {
        _parseSingle(json);
      }
    } else {
      _data = null;
    }
  }

  _parseSingle(json) {
    switch (T) {
      case UserData:
        _data = UserData.fromJson(json) as T;
        break;
      case HomeModel:
        _data = HomeModel.fromJson(json) as T;
        break;
      case SearchModel:
        _data = SearchModel.fromJson(json) as T;
        break;
      case AddToCartModel:
        _data = AddToCartModel.fromJson(json) as T;
        break;
      case MyCartModel:
        _data =MyCartModel.fromJson(json) as T;
        break;
      case CouponModel:
        _data =CouponModel.fromJson(json) as T;
        break;
      case AuthCodeModel:
        _data =AuthCodeModel.fromJson(json) as T;
        break;
      case AddOrderModel:
        _data =AddOrderModel.fromJson(json) as T;
        break;
      case MyOrdersModel:
        _data =MyOrdersModel.fromJson(json) as T;
        break;
      case ProductRatesModel:
        _data =ProductRatesModel.fromJson(json) as T;
        break;
      case NotificationModel:
        _data =NotificationModel.fromJson(json) as T;
        break;
      default:_data = null;
    }
  }

  bool _parseList(json) {
    if ("$T".contains("List<UserData>")) {
      _data = (json as List)
          .map((item) => UserData.fromJson(item))
          .toList() as T;

    }else if ("$T".contains("List<RegionsModel>")) {
      _data = (json as List)
          .map((item) => RegionsModel.fromJson(item))
          .toList() as T;

    } else if ("$T".contains("List<AddressModel>")) {
  _data = (json as List)
      .map((item) => AddressModel.fromJson(item))
      .toList() as T;

  }
    else {
      _data = null;
      return false;
    }
    /*if ("$T".contains("List<CategoriesDataModel>")) {
      _data = (json as List)
          .map((item) => CategoriesDataModel.fromJson(item))
          .toList() as T;

    }else if("$T".contains("List<Data>")){
      _data = (json as List)
          .map((item) => Data.fromJson(item))
          .toList() as T;
    }
    else if("$T".contains("List<AdoptionCategoriesModel>")){
      _data = (json as List)
          .map((item) => AdoptionCategoriesModel.fromJson(item))
          .toList() as T;
    }
    else if("$T".contains("List<RegionsModel>")){
      _data = (json as List)
          .map((item) => RegionsModel.fromJson(item))
          .toList() as T;
    }  else {
      _data = null;
      return false;
    }*/
    print(_data);
    return true;
  }

  String? get status => _status;

  String? get msg => _msg;
  int? get code => _activation_code;

  get data => _data;
  set data(value) => _data = value;
}
