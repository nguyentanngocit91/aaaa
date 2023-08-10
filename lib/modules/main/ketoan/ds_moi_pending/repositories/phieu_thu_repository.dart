import 'package:dio/dio.dart';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';
import '../providers/files_hd_provider.dart';

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

  Future<Map?> thongTinKhachHang({required List<String> emails, String? type}) async {
    final Response response = await App.dioClient.get('${ApiUrl.danhSachKhachHang}?email=$emails$type');
    if(response.statusCode==200){
      if(response.data['success']==true){
        if(response.data['data']!=null) return response.data['data'];
        return null;
      }
    }
    return null;
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

  Future<bool> updateFile({required FileHDModel fileHDModel, required String soHopDong}) async {
    FormData formData = FormData.fromMap({
      "files": [
        await MultipartFile.fromFile(fileHDModel.fileUpload!.path!, filename:fileHDModel.fileUpload?.name)
      ],
      "sohopdong":soHopDong,
      "loaifile":fileHDModel.loaiFile ?? 'hopdong',
      "ghichu":fileHDModel.ghiChu,
      'loaimedia':'khachhang',
    });
    final response = await App.dioClient.post(ApiUrl.uploadFile, data: formData);
    if(response.statusCode==200){
      if(response.data['success']) return true;
    }
    return false;
  }
}