import 'dart:convert';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';
import '../models/inforesponse_phieuthu_model.dart';
import '../models/item_phieuthu_result_model.dart';
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
    // print("$res+res_buoc_1");
      if(res['success']==false){
        result['status'] = false;
        result['message'] = "Không tìm thấy dữ liệu";
      }else {
        result['status'] = true;
        result['message'] = "Success";
        result['khachhang'] = SearchCustomerModel.fromJson(res['khachhang']);

      //  print("${result['khachhang']}+SEARCH khachhang");

       for (var item in res['hopdongs']) {
          list.add(SearchCustomerContractModel.fromJson(item));
        }
        result['hopdongs'] = list;

      }
    }

   //print("$result+SEARCH HD");

    return result;
  }



  getInfoPhieuThu(String id) async {

    final response =
    await App.dioClient.get("${ApiUrl.danhSachPhieuThu}?hopdongId=${id}");

    List<ItemPhieuthuResultModel> list = [];

    var result = {
      "status":false,
      "message":"Lỗi",
      "info":  {},
      "data":[]
    };

    if (response.statusCode == 200) {
      final res = response.data;

      if(res['success']==false){
        result['status'] = false;
        result['message'] = "Không tìm thấy dữ liệu";
      }else {

        print("${res['data']}+SEARCH ItemPhieuthuResultModel");

        result['status'] = true;
        result['message'] = "Success";
        result['info'] = InforesponsePhieuthuModel.fromJson(res);
        for (var item in res['data']) {
          list.add(ItemPhieuthuResultModel.fromJson(item));
        }
      //  print("${list}+list ItemPhieuthuResultModel");



        result['data'] = list;

        print("${result['data']}+list ItemPhieuthuResultModel");
      }
    }


    return result;
  }


 updateInfoContract({required Map<String, dynamic> data,required String id}) async{

    final response =
    await App.dioClient.put("${ApiUrl.updateContract}/${id}",queryParameters: data);

    print("${response}+response-00+${data}+");

    if(response.statusCode==200){
     // print("${response.data}+response-data");
      return response.data;


    }
    return {
      "success": false,
      "message": 'Có lỗi'
    };

  }

}