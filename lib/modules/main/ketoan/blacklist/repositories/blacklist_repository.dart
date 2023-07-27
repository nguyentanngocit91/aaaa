import 'package:dio/dio.dart';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';



class DanhsachBlackListReponsitory{
  Future<Map?> getListBlacklist() async{
    final Response response =await App.dioClient.get('${ApiUrl.danhsachBlackList}');

    if(response.statusCode==200){
      if(response.data['success']==true){
        if((response.data['data'] as List).isNotEmpty){
          return response.data;
        }


      }
    }
    return null;
  }
}

