import 'package:dio/dio.dart';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';

class PhieuThuRepository {
  Future<Map?> getListPhieuThu() async {
    print('${ApiUrl.danhSachPhieuThu}?limit=100');
    final Response response = await App.dioClient.get('${ApiUrl.danhSachPhieuThu}?page=35');
    if(response.statusCode==200){
      if(response.data['success']==true){
        return response.data;
      }
    }
    return null;
  }

  Future<Map?> searchListPhieuThu({String soPhieuThu = '', String soHD = '', String tuNgay = '', String denNgay = ''}) async {

    String strSearchSoPhieuThu = (soPhieuThu!='')?'&maphieuthu=$soPhieuThu':'';
    String strSearchSoHopDong = (soHD!='')?'&sohopdong=$soHD':'';
    String strSearchTuNgay = (tuNgay!='')?'&tungay=$tuNgay':'';
    String strSearchDenNgay = (denNgay!='')?'&denngay=$denNgay':'';
    print('${ApiUrl.danhSachPhieuThu}?$strSearchSoPhieuThu$strSearchSoHopDong$strSearchTuNgay$strSearchDenNgay');
    final Response response = await App.dioClient.get('${ApiUrl.danhSachPhieuThu}?$strSearchSoPhieuThu$strSearchSoHopDong$strSearchTuNgay$strSearchDenNgay');
    if(response.statusCode==200){
      if(response.data['success']==true){
        return response.data;
      }
    }
    return null;
  }
}
