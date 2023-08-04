

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';
import '../models/customerupdate_model.dart';
import '../models/inforesponse_phieuthu_model.dart';
import '../models/item_phieuthu_result_model.dart';
import '../models/mediacustomer_model.dart';
import '../models/searchcustomer_model.dart';
import '../models/searchcustomercontract_model.dart';

class DSHDRepository{

  searchInfo({required Map<String, dynamic> data}) async{

    final response =
    await App.dioClient.get(ApiUrl.searchContractCustomer,queryParameters:data);

    List<SearchCustomerContractModel> list = [];
    var result = {
      "status":false,
      "message":"Lỗi",
      "khachhang": {},
      "hopdongs":[]
    };
    if (response.statusCode == 200) {
      final res = response.data;
   //print("$res+res_buoc_1");
      if(res['success']==false){
        result['status'] = false;
        result['message'] = "Không tìm thấy dữ liệu";
      }else {
        result['status'] = true;
        result['message'] = "Success";
        result['khachhang'] = SearchCustomerModel.fromJson(res['khachhang']);

    //print("${result['khachhang']}+SEARCH khachhang");

       for (var item in res['hopdongs']) {
          list.add(SearchCustomerContractModel.fromJson(item));
        }
        result['hopdongs'] = list;

      //  print("${result['hopdongs']}+SEARCH hopdongs");

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

        //print("${res['data']}+SEARCH ItemPhieuthuResultModel");

        result['status'] = true;
        result['message'] = "Success";
        result['info'] = InforesponsePhieuthuModel.fromJson(res);
        for (var item in res['data']) {
          list.add(ItemPhieuthuResultModel.fromJson(item));
        }
      //  print("${list}+list ItemPhieuthuResultModel");

        result['data'] = list;

        //print("${result['data']}+list ItemPhieuthuResultModel");
      }
    }


    return result;
  }



  updateInfoContract({Map? data,required String id}) async{

    final response =
    await App.dioClient.put("${ApiUrl.updateContract}/${id}",data: data);

    // print("${response}+response-00+${data}+");

    if(response.statusCode==200){
      // print("${response.data}+response-data");
      return response.data;
    }
    return {
      "success": false,
      "message": 'Có lỗi'
    };

  }


  getInfoCustomer(String id) async {
    List<MediaCustomerModel> listMedia = [];
    final response =
    await App.dioClient.get("${ApiUrl.infoUpdateCustomer}${id}");
    
    print("${response}+ infoUpdateCustomer");
    
    var result = {
      "status": false,
      "message": "Lỗi",
      "data": {},
      "media": [],
    };
    if (response.statusCode == 200) {
      final res = response.data;

      print("${res}+ load CustomerUpdateModel");

      if (res['success'] == false) {
        result['status'] = true;
        result['message'] = "Không tìm thấy dữ liệu";
      } else {
        result['status'] = true;
        result['message'] = "Success";
        result['data'] = CustomerUpdateModel.fromJson(res["data"]);

        print("${result['data'] }+ load CustomerUpdateModel");
      }
    }

    final Response medias = await App.dioClient.get(
        "${ApiUrl.listFile}", queryParameters: {
      "limit":100,
      "loaimedia": "khachhang",
      "khachhangId": id
    });
    print("${medias}+ load medias000");

    if(medias.statusCode == 200){
      final mediaRes  = medias.data;
      if(mediaRes['success']==true){
        for(var item in mediaRes['data']){
          listMedia.add(MediaCustomerModel.fromJson(item));
        }
      }
    }

    result['media'] = listMedia;
    print("${result['media']}+ load result['media']");
    return result;
  }


  updateInfoCustomer({required String id, Map<String, String>? data}) async {
    final response =
    await App.dioClient.put("${ApiUrl.infoUpdateCustomer}${id}", data: data);

    var result = {
      "status": false,
      "data": null,
      "message": "Error"
    };

    if (response.statusCode == 200) {
      final res = response.data;
      result['status'] = res['success'];
      result['message'] = res['message'];
      if (res['success'] == true) {
        result['data'] = data;
      }
    }
    return result;
  }

  uploadFileCustomer(
      {required String makhachhang, required String khachhangId, required String loaifile, required String ghichu, required PlatformFile file}) async {
    String fileName = file.path!.split('/').last;
    FormData formData = FormData.fromMap({
      "files": [
        await MultipartFile.fromFile(file.path!, filename: fileName),
      ],
      'loaimedia':'khachhang',
      'makhachhang': makhachhang,
      'khachhangId': khachhangId,
      'loaifile': loaifile,
      'ghichu': ghichu,
    });
    final response =
    await App.dioClient.post("${ApiUrl.uploadFile}", data: formData);
    var result = {
      "status": false,
      "message": "Server error"
    };

    if (response.statusCode == 200) {
      final res = response.data;
      result['status'] = res['success'];
      result['message'] = res['message'];
    }
    return result;
  }




}