import 'package:dio/dio.dart';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';

class PhieuThuRepository {
  Future<Map?> getListPhieuThu() async {
    final Response response = await App.dioClient.get(ApiUrl.danhSachPhieuThu);
    if(response.statusCode==200){
      if(response.data['success']==true){
        return response.data;
      }
    }
    return null;
  }
}
