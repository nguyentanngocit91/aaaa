import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/utils/helper.dart';
import '../models/contract_model.dart';
import '../models/inforesponse_model.dart';
import '../models/item_search_result_model.dart';
import '../../../../../_shared/thietlap_url.dart';

class CapNhatRepository{

  searchInfo({required Map<String, dynamic> data}) async{

    final response =
        await App.dioClient.get(ApiUrl.searchContract,queryParameters:data);
    List<ItemSearchResultModel> list = [];
    var result = {
            "status":false,
            "message":"Lỗi",
            "info":  {},
            "data":[]

    };
    if (response.statusCode == 200) {
      final res = response.data;

      if(res['success']==false){
        result['status'] = true;
        result['message'] = "Không tìm thấy dữ liệu";
      }else {
        result['status'] = true;
        result['message'] = "Success";
        result['info'] = InfoResponseModel.fromJson(res);
        for (var item in res['data']) {
          list.add(ItemSearchResultModel.fromJson(item));
        }
        result['data'] = list;
      }
    }

    return result;
  }

  getInfo(String id) async {

    final response =
        await App.dioClient.get("${ApiUrl.infoContract}${id}");
    var result = {
      "status":false,
      "message":"Lỗi",
      "data":null
    };

    if (response.statusCode == 200) {
      final res = response.data;

      if(res['success']==false){
        result['status'] = true;
        result['message'] = "Không tìm thấy dữ liệu";
      }else {
        result['status'] = true;
        result['message'] = "Success";
        result['data'] = ContractModel.fromJson(res);
      }
    }
    return result;
  }
}