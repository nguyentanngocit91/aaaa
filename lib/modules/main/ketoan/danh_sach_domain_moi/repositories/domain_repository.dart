import 'package:dio/dio.dart';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';

class DomainRepository {
  Future<Map?> getListDomain() async {
    final Response response = await App.dioClient.get('${ApiUrl.danhSachDomain}?actived=0&limit=100');
    if(response.statusCode==200){
      if(response.data['success']==true){
        return response.data;
      }
    }
    return null;
  }

  Future<Map?> updateDomain({required idDomain,required ngayDangKy}) async {
    final Response response = await App.dioClient.get(ApiUrl.updateDomain);
    if(response.statusCode==200){
      if(response.data['success']==true){
        return response.data;
      }
    }
    return null;
  }


  Future<Map?> searchListDomain({String domain = ''}) async {
    String strSearchDomain = (domain!='')?'&tenmien=$domain':'';
    final Response response = await App.dioClient.get('${ApiUrl.danhSachDomain}?actived=0&$strSearchDomain');
    if(response.statusCode==200){
      if(response.data['success']==true){
        return response.data;
      }
    }
    return null;
  }
}
