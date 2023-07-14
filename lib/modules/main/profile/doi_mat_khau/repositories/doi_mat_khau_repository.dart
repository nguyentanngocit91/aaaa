import 'package:dio/dio.dart';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';

class DoiMatKhauRepository{
  final _dioClient = App.dioClient;

  Future<Map> capNhatMatKhau({Map? data}) async{
    final Response response = await _dioClient.put(ApiUrl.changePassword, data: data);
    if(response.statusCode==200){
      return response.data;
    }
    return {
      "success": false,
      "message": 'Có lỗi'
    };
  }
}