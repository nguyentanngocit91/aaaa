import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../../_shared/app_config/app.dart';

import '../models/contract_model.dart';
import '../models/inforesponse_model.dart';
import '../models/item_search_result_model.dart';
import '../../../../../_shared/thietlap_url.dart';
import '../models/media_model.dart';

class CapNhatRepository {

  searchInfo({required Map<String, dynamic> data}) async {
    final response =
    await App.dioClient.get(ApiUrl.searchContract, queryParameters: data);
    List<ItemSearchResultModel> list = [];
    var result = {
      "status": false,
      "message": "Lỗi",
      "info": {},
      "data": []
    };
    if (response.statusCode == 200) {
      final res = response.data;

      if (res['success'] == false) {
        result['status'] = true;
        result['message'] = "Không tìm thấy dữ liệu";
      } else {
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
    List<MediaModel> listMedia = [];
    final response =
    await App.dioClient.get("${ApiUrl.infoContract}${id}");
    var result = {
      "status": false,
      "message": "Lỗi",
      "data": null,
      "media": [],
    };

    ContractModel? item;
    if (response.statusCode == 200) {
      final res = response.data;

      if (res['success'] == false) {
        result['status'] = true;
        result['message'] = "Không tìm thấy dữ liệu";
      } else {
        result['status'] = true;
        result['message'] = "Success";
        item = ContractModel.fromJson(res);
        result['data'] = item;
      }

    if(res['success']) {
      final Response medias = await App.dioClient.get(
          "${ApiUrl.listFile}", queryParameters: {
        "limit": 100,
        "sohopdong": item!.l1_data!.sohopdong!
      });

      if (medias.statusCode == 200) {
        final mediaRes = medias.data;
        if (mediaRes['success'] == true) {
          for (var item in mediaRes['data']) {
            listMedia.add(MediaModel.fromJson(item));
          }
        }
      }


      result['media'] = listMedia;
    }
    }
    return result;
  }

  updateMedia(Map data) async {
    final response =
        await App.dioClient.put("${ApiUrl.updateFile}${data['id']}", data: {'ghichu':data['ghichu'],'loaifile':data['loaifile']});
    var result = {
      "status": false,
      "data": null,
      "message": "Error"
    };
    if (response.statusCode == 200) {
      final res = response.data;
      result['status'] = res['success'];
      result['message'] = res['message'];
      result['data'] = res['data'];

    }
    return result;
  }
  update({required String id, Map<String, String>? data}) async {
    final response =
    await App.dioClient.put("${ApiUrl.infoContract}${id}", data: data);
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

  uploadFile(
      {required String sohopdong, required String hopdongId, required String loaifile, required String ghichu, required PlatformFile file}) async {
    String fileName = file.path!.split('/').last;
    FormData formData = FormData.fromMap({
      "files": [
        await MultipartFile.fromFile(file.path!, filename: fileName),
      ],
      'loaimedia':'hopdong',
      'sohopdong': sohopdong,
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