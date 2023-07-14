import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../_shared/app_config/app.dart';
import '../../../_shared/thietlap_url.dart';
import '../models/user_model.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

class AuthRepository{
  late final Box boxAuth;

  setup() async {
    boxAuth = await Hive.openBox('user_login');
    return token;
  }

  String? get token => boxAuth.get('accessToken');

  Future<bool> tokenIsValid() async {
    try{
      final response =
      await App.dioClient.post(ApiUrl.checkToken);
      if(response.statusCode==401) return false;
      return true;
    } catch(e){
      return false;
    }
  }

  Future<UserModel?> getInfoUser() async {
    if(token!=null){
      final response = await App.dioClient.get(ApiUrl.infoUser);
      if(response.statusCode==200){
        final jsonData = response.data['data'];
        return UserModel.fromJson(jsonData);
      }
      return null;
    }
    return null;
  }

  saveToken({required Map<String, dynamic> data}){
    boxAuth.put('accessToken', data['accessToken']);
    boxAuth.put('refreshToken', data['refreshToken']);
    App.dioClient.initOptions();
  }

  clearData(){
    boxAuth.clear();
  }

  Future<Map> signIn({required Map<String, dynamic> data}) async{
    Map result = {
      "message":"",
      "userSignIn":""
    };
    final response =
        await App.dioClient.post(ApiUrl.signIn, data: data);
    if (response.statusCode == 200) {
      final res = response.data;
      if (res['success'] == true) {
        result = {
          "message":"",
          "userSignIn":res['data']
        };
        saveToken(data: res['data']);
      }else{
        result = {
          "message":res['message'],
          "userSignIn":null
        };
      }
    }
    return result;
  }
}