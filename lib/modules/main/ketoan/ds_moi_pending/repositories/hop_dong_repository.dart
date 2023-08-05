import '../../../../../_shared/app_config/app.dart';
import '../../../../../_shared/thietlap_url.dart';
import '../models/hopdong_model.dart';

class HopDongRepository{

  Future<Map<String, dynamic>> layDanhSach({int? currentPage = 1, int? pageSize = 10}) async {
    List<HopDongModel> list = [];
    int totalRow = 0;
    final response = await App.dioClient.get('${ApiUrl.danhSachHDTheoSoHD}?page=$currentPage&limit=$pageSize');
    if(response.statusCode==200){
      if(response.data['success']==true){
        totalRow = response.data["total"];
        if((response.data['data'] as List).isNotEmpty){
          for(var item in response.data['data']){
            if(item!=null) list.add(HopDongModel.fromJson(item));
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