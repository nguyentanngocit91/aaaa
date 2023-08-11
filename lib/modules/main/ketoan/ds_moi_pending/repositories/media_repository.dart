import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';
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
}