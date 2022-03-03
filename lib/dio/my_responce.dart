

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
      _checkType(json['Data']);
    } else if (json.containsKey("data")) {
      _checkType(json['data']);
    }


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
      /*case ServiceProviderModel:
        _data = ServiceProviderModel.fromJson(json) as T;
        break;

      case AnimalPagerListModel:
        _data = AnimalPagerListModel.fromJson(json) as T;
        break;*/

      default:_data = null;
    }
  }

  bool _parseList(json) {
    if ("$T".contains("List<UserData>")) {
      _data = (json as List)
          .map((item) => UserData.fromJson(item))
          .toList() as T;

    } else {
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
