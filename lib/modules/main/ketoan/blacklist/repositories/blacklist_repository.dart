import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';

class DanhsachBlackListReponsitory {
  Future<Map?> getListBlacklist() async {
    final Response response =
        await App.dioClient.get('${ApiUrl.danhsachBlackList}?limit=150');

    if (response.statusCode == 200) {
      if (response.data['success'] == true) {
        if ((response.data['data'] as List).isNotEmpty) {
          return response.data;
        }
      }
    }
    return null;
  }
  // add blacklist


Future<String?> addBlacklist({required String maHD,required String ghichuHD}) async {


    var data= {
      "mahopdong": "${maHD}",
      "ghichu": "${ghichuHD}"
    };

   // print(data.toString());
    final Response response = await App.dioClient.post('${ApiUrl.danhsachBlackList}',data:jsonEncode(data));

  if (response.statusCode == 200) {
   return  response.data['message'];
  }
  return '';
}

}
