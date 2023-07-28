import 'dart:convert';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';
import '../models/infocontractresponse_model.dart';
import '../models/item_contract_search_result_model.dart';

class DSHDRepository{

  searchInfo({required Map<String, dynamic> data}) async{


    final response =
    await App.dioClient.get(ApiUrl.searchContract,queryParameters:data);


    List<ItemContractSearchResultModel> list = [];
    var result = {
      "status":false,
      "message":"Lỗi",
      "info":  {},
      "data":[]

    };
    if (response.statusCode == 200) {
      final res = response.data;
     // print("$res+res_buoc_1");
      if(res['success']==false){
        result['status'] = true;
        result['message'] = "Không tìm thấy dữ liệu";
      }else {
        result['status'] = true;
        result['message'] = "Success";
        result['info'] = InfoContractResponseModel.fromJson(res);
       for (var item in res['data']) {
          list.add(ItemContractSearchResultModel.fromJson(item));
        }
        result['data'] = list;

      }
    }

   // print(result);

    return result;
  }
}