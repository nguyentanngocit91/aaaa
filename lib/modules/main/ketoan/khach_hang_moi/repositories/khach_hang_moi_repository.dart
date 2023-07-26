import 'package:dio/dio.dart';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';

class KhachHangMoiRepository {

  Future<String?> capMaKhachhang() async {
    final Response response = await App.dioClient.get(ApiUrl.capMaKhachHang);
    if(response.statusCode==200){
      if(response.data['success']==true){
        return response.data['number'].toString();
      }
    }
    return null;
  }

  Future<String?> capMaHopDong() async {
    final Response response = await App.dioClient.get(ApiUrl.capMaHopDong);
    if(response.statusCode==200){
      if(response.data['success']==true){
        return response.data['number'].toString();
      }
    }
    return null;
  }

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
