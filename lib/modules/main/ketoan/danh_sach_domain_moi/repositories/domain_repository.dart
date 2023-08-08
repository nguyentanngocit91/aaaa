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

  Future<bool> updateDomain({required String idDomain,required Map? data}) async {

    final Response response = await App.dioClient.post('${ApiUrl.danhSachDomain}/$idDomain',data: data);
    print(response);
    if(response.statusCode==200){
      if(response.data['success']==true && response.data['data']!=null) return true;
    }
    return false;
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
