import 'package:dio/dio.dart';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';

class DomainRepository {
  Future<Map?> getListDomain() async {
    final Response response = await App.dioClient.get('${ApiUrl.danhSachDomain}?limit=100');
    if(response.statusCode==200){
      if(response.data['success']==true){
        return response.data;
      }
    }
    return null;
  }

  Future<Map?> registerDomain({required idDomain}) async {
    final Response response = await App.dioClient.get('${ApiUrl.danhSachDomain}?limit=100');
    if(response.statusCode==200){
      if(response.data['success']==true){
        return response.data;
      }
    }
    return null;
  }


  Future<Map?> searchListDomain({String domain = ''}) async {


    String strSearchDomain = (domain!='')?'&domain=$domain':'';
    final Response response = await App.dioClient.get('${ApiUrl.danhSachDomain}?$strSearchDomain');
    if(response.statusCode==200){
      if(response.data['success']==true){

        print(response.data);
        return response.data;
      }
    }
    return null;
  }
}
