import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_shared/utils/form_status.dart';
import '../models/phieu_thu_model.dart';
import '../repositories/phieu_thu_repository.dart';

part 'phieu_thu_state.dart';

final PhieuThuRepository _phieuthuRepository = PhieuThuRepository();

final phieuThuProvider =
NotifierProvider<PhieuthuNotifier, PhieuThuState>(() {
  return PhieuthuNotifier();
});

class PhieuthuNotifier extends Notifier<PhieuThuState> {



  @override
  PhieuThuState build() {
    getListPhieuThu();
    return PhieuThuState().copyWith(listPhieuThu: []);
  }

  Future<Map?> getListPhieuThu() async {
    final result = await _phieuthuRepository.getListPhieuThu();
    if(result!=null){

    }
    return null;
  }

}



final futureListPhieuThuProvider =
FutureProvider.autoDispose<List<PhieuThuModel>?>((ref) async {
  final List<PhieuThuModel> list = [];
  final response = await _phieuthuRepository.getListPhieuThu();

  if (response!= null) {
    if (response['success']) {
      for (var json in response['data']) {
        list.add(PhieuThuModel.fromJson(json));
      }
    }
  }
  return list;
});
