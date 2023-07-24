import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_shared/utils/form_status.dart';

part 'form_khach_hang_moi_state.dart';

final formKhachHangMoiProvider =
    NotifierProvider<FormKhachHangMoiNotifier, FormKhachHangMoiState>(() {
  return FormKhachHangMoiNotifier();
});

class FormKhachHangMoiNotifier extends Notifier<FormKhachHangMoiState> {
  @override
  FormKhachHangMoiState build() {
    return FormKhachHangMoiState();
  }

  init(){

  }

  checkLoaiHopDong(
      {bool? isHopDongWebsite,
      bool? isHopDongApp,
      bool? isHopDongDomain,
      bool? isHopDongHosting}) {
    state = state.copyWith(
      isHopDongApp: isHopDongApp ?? state.isHopDongApp,
      isHopDongHosting: isHopDongHosting ?? state.isHopDongHosting,
      isHopDongDomain: isHopDongDomain ?? state.isHopDongDomain,
      isHopDongWebsite: isHopDongWebsite ?? state.isHopDongWebsite,
    );
  }

  changeData(
      {required String type, required String key, required dynamic value}) {
    switch(type){
      case 'khachhang':
        Map newDataKhachHang = state.dataKhachHang ?? {};
        newDataKhachHang.update(key, (item) => value, ifAbsent: () => value);
        state = state.copyWith(dataKhangHang: newDataKhachHang);
      case 'hopdong':
        Map newDataHopDong = state.dataHopDong ?? {};
        newDataHopDong.update(key, (item) {
          if(key == 'tongtien') return value.toString().replaceAll('.', '');
          return value;
        }, ifAbsent: () => value);
        state = state.copyWith(dataHopDong: newDataHopDong);
      case 'phieuthu':
        Map newDataPhieuThu = state.dataPhieuThu ?? {};
        newDataPhieuThu.update(key, (item) => value, ifAbsent: () => value);
        state = state.copyWith(dataPhieuThu: newDataPhieuThu);
      case 'website':
        Map newDataWebsite = state.dataWebsite ?? {};
        newDataWebsite.update(key, (item) => value, ifAbsent: () => value);
        state = state.copyWith(dataWebsite: newDataWebsite);
      case 'domain':
        Map newDataDomain = state.dataDomain ?? {};
        newDataDomain.update(key, (item) => value, ifAbsent: () => value);
        state = state.copyWith(dataDomain: newDataDomain);
      case 'hosting':
        Map newDataHosting = state.dataHosting ?? {};
        newDataHosting.update(key, (item) => value, ifAbsent: () => value);
        state = state.copyWith(dataHosting: newDataHosting);
      case 'app':
        Map newDataApp = state.dataApp ?? {};
        newDataApp.update(key, (item) => value, ifAbsent: () => value);
        state = state.copyWith(dataApp: newDataApp);
    }
  }

  saveForm() {
    saveKhachHang();
    saveHopDong();
    savePhieuThu();
    saveWebsite();
    saveDomain();
    saveHosting();
    saveApp();
    print('submit done!');
  }

  saveKhachHang(){
    if (state.dataKhachHang != null) {
      state.dataKhachHang!.forEach((key, value) {
        print('Khách hàng {$key:$value}');
      });
    }
  }

  saveHopDong(){
    if (state.dataHopDong != null) {
      state.dataHopDong!.forEach((key, value) {
        print('Hợp đồng {$key:$value}');
      });
    }
  }

  savePhieuThu(){

  }

  saveWebsite(){
    if (state.dataWebsite != null) {
      state.dataWebsite!.forEach((key, value) {
        print('Website {$key:$value}');
      });
    }
  }

  saveHosting(){

  }

  saveDomain(){

  }

  saveApp(){

  }
}
