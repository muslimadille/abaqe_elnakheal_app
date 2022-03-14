import 'dart:convert';
import '../../../dio/dio_utils.dart';
import '../../../dio/my_responce.dart';
import '../../../utils/apis.dart';
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
}