import 'dart:convert';
import '../../../dio/dio_utils.dart';
import '../../../dio/my_responce.dart';
import '../../../utils/apis.dart';
import '../../dio/models/addressModel.dart';
import '../../dio/models/region_model.dart';

class RegionsApi{

  Future<MyResponse<List<RegionsModel>>> getRegions() async {
    final url = "${Apis.REGIONS_API}";
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_GET, url);
    if (response != null && response.statusCode == 200) {
      return MyResponse<List<RegionsModel>>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<List<RegionsModel>>.init(response!.statusCode.toString(),response.statusMessage!, null);
    }
  }
  Future<MyResponse<List<AddressModel>>> addAddress(String name,String address,String note,int regionId,int stateId) async {
    final url = Apis.ADD_ADDRESS_API;
    Map<String,dynamic>body={
      "name":name,
      "address":address,
      "region_id":regionId,
      "state_id":stateId,
      "notes":note
    };
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_POST, url,body: body);
    if (response != null && response.statusCode == 200) {
      return MyResponse<List<AddressModel>>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<List<AddressModel>>.init(response!.statusCode.toString(),response.statusMessage!, null);
    }
  }
}