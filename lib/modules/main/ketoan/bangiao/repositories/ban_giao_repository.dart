import 'package:dio/dio.dart';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';

class BanGiaoRepository {
  Future<Map?> getListHopDongBySoHD({required String soHD}) async {
    final Response response = await App.dioClient.get('${ApiUrl.danhSachHDTheoSoHD}?sohopdong=$soHD');
    if(response.statusCode==200){
      if(response.data['success']==true){
        return response.data;
      }
    }
    return null;
  }

  Future<Map?> getListFileBySoHD({required String soHD}) async {
    final Response response = await App.dioClient.get('${ApiUrl.listFile}?sohopdong=$soHD');
    if(response.statusCode==200){
      if(response.data['success']==true){
        return response.data;
      }
    }
    return null;
  }

}
