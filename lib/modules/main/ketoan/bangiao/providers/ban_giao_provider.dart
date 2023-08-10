import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_shared/utils/form_status.dart';
import '../models/ban_giao_model.dart';
import '../models/khach_hang_model.dart';
import '../repositories/ban_giao_repository.dart';
import 'ban_giao_state.dart';



final banGiaoProvider = NotifierProvider<BanGiaoNotifier, BanGiaoState>(() {
  return BanGiaoNotifier();
});

class BanGiaoNotifier extends Notifier<BanGiaoState> {
  final BanGiaoRepository _banGiaoRepository = BanGiaoRepository();

  @override
  BanGiaoState build() {
    return BanGiaoState();
  }

  void setInputMaHD({required String? maHD}){
    if(maHD!=null) {
      state = state.copyWith(maHD: maHD);
    }
  }

  void setInputTenHopDong({required String? tenHD}){
    if(tenHD!=null) {
      state = state.copyWith(maHD: tenHD);
    }
  }

  void setInputDienThoai({required String? dienThoai}){
    if(dienThoai!=null) {
      state = state.copyWith(dienThoai: dienThoai);
    }
  }

  void setInputEmail({required String? email}){
    if(email!=null) {
      state = state.copyWith(email: email);
    }
  }

  void setInputDomain({required String? domain}){
    if(domain!=null) {
      state = state.copyWith(domain: domain);
    }
  }

  void resetInputSearch(){
    state = state.copyWith(maHD: '',tenHD: '',email: '',dienThoai: '',domain: '', listHD: [], khachHang: null);

  }

  Future<void> actionInputSearch() async {
    var soHD = state.maHD;
    var listHD = state.listHD;
    var khachHang = state.khachHang;
    final KhachHangModel khachHangTemp;
    final List<BanGiaoModel> list = [];
    state = state.copyWith(status: FormStatus.submissionInProgress,listHD: [], khachHang: null);
    if(soHD!= null ) {
      var response = await getListHopDong(soHD: soHD);
      if(response!=null) {
        for (var json in response['hopdongs']) {
          list.add(BanGiaoModel.fromJson(json));
        }
        khachHangTemp = KhachHangModel.fromJson(response['khachhang']);
        listHD = list;
        khachHang = khachHangTemp;
      }
    }
    state = state.copyWith(status: FormStatus.submissionSuccess);
    state = state.copyWith(listHD: listHD,khachHang: khachHang);

  }
  Future<Map?> getListHopDong({required String soHD}) async {
    
    final response = await _banGiaoRepository.getListHopDongBySoHD(soHD: soHD);
    return response;
  }
}
