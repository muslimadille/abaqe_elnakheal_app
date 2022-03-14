import 'dart:convert';

import '../../../dio/dio_utils.dart';
import '../../../dio/models/user_data.dart';
import '../../../dio/my_responce.dart';
import '../../../utils/apis.dart';
import '../../search/search_model.dart';

class SearchApi{

  Future<MyResponse<SearchModel>> search({int? categoryId, String? searchKey}) async {
    final url = "${Apis.SEARCH_API}?category_id=${categoryId??""}&search_key=${searchKey??""}";

    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_GET, url);
    if (response != null && response.statusCode == 200) {
      return MyResponse<SearchModel>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<SearchModel>.init(response!.statusCode.toString(),response.statusMessage!, null);
    }
  }
}