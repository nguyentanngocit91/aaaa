import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';
import '../providers/files_hd_provider.dart';

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

  Future<Map?> thongTinKhachHang({required String email, String? type}) async {
    final Response response = await App.dioClient.get('${ApiUrl.danhSachKhachHang}?email=$email$type');
    if(response.statusCode==200){
      if(response.data['success']==true){
        if(response.data['data']!=null) return response.data['data'];
        return null;
      }
    }
    return null;
  }

  Future<Map?> thongTinNhanVien({required String maNhanVien}) async {
    final Response response = await App.dioClient.get('${ApiUrl.danhSachNhanVien}?manhanvien=$maNhanVien');
    if(response.statusCode==200){
      if(response.data['success']==true){
        if((response.data['data'] as List).isNotEmpty) return response.data['data'][0];
        return null;
      }
    }
    return null;
  }

  Future<bool> luuThongTinKhachHang({required Map? data}) async {
    final Response response = await App.dioClient.post(ApiUrl.danhSachKhachHang, data: data);
    if(response.statusCode==200){
      if(response.data['success']==true && response.data['data']!=null) return true;
    }
    return false;
  }

  Future<bool> luuThongTinPhieuThu({required Map? data}) async {
    final Response response = await App.dioClient.post(ApiUrl.danhSachPhieuThu, data: data);
    if(response.statusCode==200){
      if(response.data['success']==true && response.data['data']!=null) return true;
    }
    return false;
  }

  Future saveFile(FileHDModel fileHDModel) async {
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile('${fileHDModel.fileUpload?.path}', filename:fileHDModel.fileUpload?.name),
      "sohopdong":"",
      "hopdongId":"",
      "loaifile":fileHDModel.loaiFile,
      "ghichu":fileHDModel.ghiChu,
    });
    final response = await App.dioClient.post(ApiUrl.uploadFile, data: formData);
    // return response.data['id'];
  }


}
