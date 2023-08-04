import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_shared/utils/form_status.dart';
import '../models/ban_giao_model.dart';
import '../models/file_model.dart';
import '../repositories/ban_giao_repository.dart';




final banGiaoProvider = NotifierProvider<BanGiaoNotifier, List<FileModel>>(() {
  return BanGiaoNotifier();
});

class BanGiaoNotifier extends Notifier<List<FileModel>> {
  final BanGiaoRepository _banGiaoRepository = BanGiaoRepository();

  @override
  List<FileModel> build() {
    return [];
  }

  void setInputMaHD({required String? maHD}){
    if(maHD!=null) {
     
    }
  }
  Future<List<BanGiaoModel>?> getListHopDong({required String soHD}) async {
    final List<BanGiaoModel> list = [];
    final response = await _banGiaoRepository.getListHopDongBySoHD(soHD: soHD);
    if(response!=null){
      for (var json in response['data']) {
        list.add(BanGiaoModel.fromJson(json));
      }
      return list;
    }
    return null;
  }
}
