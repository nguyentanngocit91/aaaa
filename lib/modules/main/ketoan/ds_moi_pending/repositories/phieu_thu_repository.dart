import 'package:dio/dio.dart';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';

class PhieuThuRepository{
  Future<Map> chiTietPhieuThu({required String id}) async {
    final response = await App.dioClient.get('${ApiUrl.danhSachPhieuThu}/$id');
    if(response.statusCode==200){
      if(response.data['success']==true){
        return response.data;
      }
    }
    return {};
  }

  Future<String?> capMaKhachhang() async {
    final Response response = await App.dioClient.get(ApiUrl.capMaKhachHang);
    if(response.statusCode==200){
      if(response.data['success']==true){
        return response.data['number'].toString();
      }
    }
    return null;
  }

  Future<bool> kiemTraEmailKhachHang({required String email, required String maKhachHang, String type = ''}) async {
    final Response response = await App.dioClient.get('${ApiUrl.danhSachKhachHang}?email=$email&makhachhang=$maKhachHang');
    if(response.statusCode==200){
      if(response.data['success']==true){
        if(int.parse(response.data['total'].toString()) == 0) return true;
      }
    }
    return false;
  }

  Future<Map?> thongTinNhanVien({required String maNhanVien}) async {
    final response = await App.dioClient.get('${ApiUrl.danhSachNhanVien}?manhanvien=$maNhanVien');
    if(response.statusCode==200){
      if(response.data['success']==true){
        if((response.data['data'] as List).isNotEmpty) return response.data['data'][0];
        return null;
      }
    }
    return null;
  }
}