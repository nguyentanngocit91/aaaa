import 'package:dio/dio.dart';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';

class KhachHangMoiRepository {
  Future<Map?> thongTinKhachHang({required String email}) async {
    final Response response = await App.dioClient.get('${ApiUrl.danhSachKhachHang}?email=$email');
    if(response.statusCode==200){
      if(response.data['success']==true){
        if((response.data['data'] as List).isNotEmpty) return response.data['data'][0];
        return null;
      }
    }
    return null;
  }
}
