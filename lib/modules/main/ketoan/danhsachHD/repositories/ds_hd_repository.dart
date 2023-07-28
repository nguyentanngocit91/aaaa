import 'dart:convert';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';

import '../models/item_contract_search_result_model.dart';
import '../models/searchcontractcustomer_model.dart';
import '../models/searchcustomer_model.dart';
import '../models/searchcustomercontract_model.dart';

class DSHDRepository{

  searchInfo({required Map<String, dynamic> data}) async{


    final response =
    await App.dioClient.get(ApiUrl.searchContractCustomer,queryParameters:data);

   // print("$response+SEARCH HD");
    List<SearchCustomerContractModel> list = [];
    var result = {
      "status":false,
      "message":"Lỗi",
      "khachhang": {},
      "hopdongs":[]

    };
    if (response.statusCode == 200) {
      final res = response.data;
     print("$res+res_buoc_1");
      if(res['success']==false){
        result['status'] = false;
        result['message'] = "Không tìm thấy dữ liệu";
      }else {
        result['status'] = true;
        result['message'] = "Success";
        result['khachhang'] = SearchCustomerModel.fromJson(res['khachhang']);

        print("${result['khachhang']}+SEARCH khachhang");

       for (var item in res['hopdongs']) {
          list.add(SearchCustomerContractModel.fromJson(item));
        }
        result['hopdongs'] = list;

      }
    }

   print("$result+SEARCH HD");

    return result;
  }
}