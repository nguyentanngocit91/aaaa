import 'package:dio/dio.dart';

import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';
import '../providers/files_hd_provider.dart';
import '../models/file_model.dart';

class MediaRepository{
  Future<Map<String, dynamic>> layDanhSach({required String soHopDong,int? currentPage = 1, int? pageSize = 10}) async {
    List<FileModel> list = [];
    int totalRow = 0;
    final response = await App.dioClient.get('${ApiUrl.listFile}?sohopdong=$soHopDong&page=$currentPage&limit=$pageSize');
    if(response.statusCode==200){
      if(response.data['success']==true){
        totalRow = response.data["totalResult"];
        if((response.data['data'] as List).isNotEmpty){
          for(var item in response.data['data']){
            if(item!=null) list.add(FileModel.fromJson(item));
          }
        }
      }
    }
    return {
      'totalRow' : totalRow,
      'data' : list,
    };
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