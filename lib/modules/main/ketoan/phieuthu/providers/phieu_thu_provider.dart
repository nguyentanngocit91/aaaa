import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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
    return PhieuThuState(status: FormStatus.submissionInProgress);
  }

  init() async {
    await getListPhieuThu();
  }

  void resetInputSearch() async{
    state = state.copyWith(soPhieuThu: '',maHopDong: '',tuNgay: '',denNgay: '');
    await getListPhieuThu();

  }

  void setInputSoPhieuThu({required String? soPhieuThu}){
    if(soPhieuThu!=null) {
      state = state.copyWith(soPhieuThu: soPhieuThu);
    }
  }

  void setInputMaHopDong({required String? mahopDong}){
    if(mahopDong!=null) {
      state = state.copyWith(maHopDong: mahopDong);
    }
  }

  void setInputTuNgay({required String? tuNgay}){
    if(tuNgay!=null) {
      state = state.copyWith(tuNgay: tuNgay);
    }
  }
  void setInputDenNgay({required String? denNgay}){
    if(denNgay!=null) {
      state = state.copyWith(denNgay: denNgay);
    }
  }

  Future<void> actionInputSearch() async {
    var soPhieuThu = state.soPhieuThu;
    var maHopDong = state.maHopDong;
    var tuNgay = state.tuNgay;
    var denNgay = state.denNgay;
    List<PhieuThuModel> listPhieuThu = [];

    soPhieuThu ??= '';
    maHopDong ??= '';
    tuNgay ??= '';
    denNgay ??= '';

    if(tuNgay !='' && denNgay !=''){
      DateTime date1 = DateFormat('dd-MM-yyyy').parse(tuNgay);
      DateTime date2 = DateFormat('dd-MM-yyyy').parse(denNgay);
      tuNgay = DateFormat('yyyy-MM-dd').format(date1);
      denNgay = DateFormat('yyyy-MM-dd').format(date2);
    }

    state = state.copyWith(status: FormStatus.submissionInProgress,listPhieuThu: []);
    List<PhieuThuModel>? temp = await searchPhieuThu(soPhieuThu: soPhieuThu,maHopDong: maHopDong, tuNgay: tuNgay, denNgay:  denNgay);
      if(temp!=null) {
        listPhieuThu = temp;
      }
    state = state.copyWith(status: FormStatus.submissionSuccess);
    state = state.copyWith(listPhieuThu: listPhieuThu);

  }

  Future<List<PhieuThuModel>?> searchPhieuThu({String soPhieuThu = '', String maHopDong = '', String tuNgay = '', String denNgay = ''}) async {
    final List<PhieuThuModel> list = [];
    final response = await _phieuthuRepository.searchListPhieuThu(soPhieuThu: soPhieuThu,soHD: maHopDong,tuNgay: tuNgay,denNgay: denNgay);
    if (response!= null) {
      if (response['success']) {
        for (var json in response['data']) {
          list.add(PhieuThuModel.fromJson(json));
        }
        return list;
      }
    }
   return null;
  }

  Future<void> getListPhieuThu() async {
    final List<PhieuThuModel> list = [];
    final response = await _phieuthuRepository.getListPhieuThu();
    if (response!= null) {
      if (response['success']) {
        for (var json in response['data']) {
          list.add(PhieuThuModel.fromJson(json));
        }
      }
    }
    state = state.copyWith(listPhieuThu: list,status: FormStatus.submissionSuccess);
  }

}
