import 'package:dio/dio.dart';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';
import '../models/customerupdate_model.dart';
import '../providers/files_hd_provider.dart';

class HopDongKyMoiRepository {


  Future<Map> chiTietKhachHang({required String id}) async {
    final response = await App.dioClient.get('${ApiUrl.infoUpdateCustomer}${id.toString()}');

    print("${response}+ chiTietKhachHang");
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

  Future<String?> capSoHopDong() async {
    final Response response = await App.dioClient.get(ApiUrl.capMaHopDong);
    if(response.statusCode==200){
      if(response.data['success']==true){
        return response.data['number'].toString();
      }
    }
    return null;
  }

  Future<Map?> thongTinKhachHang({required String id}) async {
    final Response response = await App.dioClient.get('${ApiUrl.infoUpdateCustomer}$id');
    if(response.statusCode==200){
      if(response.data['success']==true){
        if(response.data['data']!=null) return response.data['data'];
        return null;
      }
    }
    return null;
  }

  /*Future<Map?> thongTinKhachHang({required String email, String? type}) async {
    final Response response = await App.dioClient.get('${ApiUrl.danhSachKhachHang}?email=$email$type');
    if(response.statusCode==200){
      if(response.data['success']==true){
        if(response.data['data']!=null) return response.data['data'];
        return null;
      }
    }
    return null;
  }*/

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

  Future<bool> luuHopDongMoi({required dynamic data}) async {
    final Response response = await App.dioClient.post(ApiUrl.phieuThuMoi, data: data);
    if(response.statusCode==200){
      if(response.data['success']==true) return true;
    }
    return false;
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


  getInfoCustomerByID(String id) async {
    final response =
    await App.dioClient.get("${ApiUrl.infoUpdateCustomer}${id}");

    // print("${response}+ infoUpdateCustomer");

    var result = {
      "status": false,
      "message": "Lỗi",
      "data": {},
    };
    if (response.statusCode == 200) {
      final res = response.data;
      // print("${res}+ load CustomerUpdateModel");
      if (res['success'] == false) {
        result['status'] = true;
        result['message'] = "Không tìm thấy dữ liệu";
      } else {
        result['status'] = true;
        result['message'] = "Success";
        result['data'] = CustomerUpdateModel.fromJson(res["data"]);
        // print("${result['data'] }+ load CustomerUpdateModel");
      }
    }
    return result;
  }


}
