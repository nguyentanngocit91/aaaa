import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../../../_shared/app_config/app.dart';
import '../models/item_search_result_model.dart';
import '../../../../../_shared/thietlap_url.dart';

// final searchProvide = Provider<searchProvider>((ref) {
//   return AuthRepository();
// });

class CapNhatRepository{

  //
  // saveToken({required Map<String, dynamic> data}){
  //   boxAuth.put('accessToken', data['accessToken']);
  //   boxAuth.put('refreshToken', data['refreshToken']);
  //   App.dioClient.initOptions();
  // }
  //
  // clearData(){
  //   boxAuth.clear();
  // }
  //
  //Future<Map> searchInfo({required Map<String, dynamic> data}) async{
  searchInfo({required Map<String, dynamic> data}) async{

    final response =
        await App.dioClient.get(ApiUrl.searchContract,queryParameters:data);
    var result = {
            "status":false,
            "message":"Lỗi",
            "data":[]
    };
    if (response.statusCode == 200) {
      final res = response.data;
      if(res['success']==false){
        result['status'] = true;
        result['message'] = "Không tìm thấy dữ liệu";
      }else {
        result['status'] = true;
        result['message'] = "Không tìm thấy dữ liệu";
        List<ItemSearchResultModel> list = [];
        for(var item in res['data']){
          list.add(ItemSearchResultModel.fromJson(item));
        }

      }

    }

    //
    //
    // if (response.statusCode == 200) {
    //   final res = response.data;
    //   if (res['success'] == true) {
    //     result = {
    //       "message":"",
    //       "userSignIn":res['data']
    //     };
    //
    //   }else{
    //     result = {
    //       "message":res['message'],
    //       "userSignIn":null
    //     };
    //   }
    // }
    // return result;
  }
}