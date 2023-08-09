import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_shared/extensions/date_time_extention.dart';
import '../../../../../_shared/utils/form_status.dart';
import '../models/phieu_thu_model.dart';
import '../repositories/phieu_thu_repository.dart';

class FormPhieuThuState {
  final FormStatus? formStatus;
  final String? soHopDong;
  final String? maKhachHang;
  final Map? dataKhachHang;
  final Map? dataHopDong;
  final Map? dataPhieuThu;
  final Map? dataWebsite;
  final Map? dataDomain;
  final Map? dataHosting;
  final Map? dataApp;
  final bool isHopDongWebsite;
  final bool isHopDongDomain;
  final bool isHopDongHosting;
  final bool isHopDongApp;
  final bool isLoading;
  final PhieuThuModel? phieuThuModel;

  FormPhieuThuState({
    this.formStatus = FormStatus.pure,
    this.soHopDong,
    this.maKhachHang,
    this.dataKhachHang,
    this.dataHopDong,
    this.dataPhieuThu,
    this.dataWebsite,
    this.dataDomain,
    this.dataHosting,
    this.dataApp,
    this.isHopDongWebsite = true,
    this.isHopDongApp = false,
    this.isHopDongDomain = false,
    this.isHopDongHosting = false,
    this.phieuThuModel,
    this.isLoading = true,
  });

  copyWith(
      {FormStatus? formStatus,
        String? soHopDong,
        String? maKhachHang,
        Map? dataKhachHang,
        Map? dataHopDong,
        Map? dataPhieuThu,
        Map? dataWebsite,
        Map? dataDomain,
        Map? dataHosting,
        Map? dataApp,
        bool? isHopDongWebsite,
        bool? isHopDongApp,
        bool? isHopDongDomain,
        bool? isHopDongHosting,
      PhieuThuModel? phieuThuModel,
      bool? isLoading,}) {
    return FormPhieuThuState(
      formStatus: formStatus ?? this.formStatus,
      soHopDong: soHopDong ?? this.soHopDong,
      maKhachHang: maKhachHang ?? this.maKhachHang,
      dataKhachHang: dataKhachHang ?? this.dataKhachHang,
      dataHopDong: dataHopDong ?? this.dataHopDong,
      dataPhieuThu: dataPhieuThu ?? this.dataPhieuThu,
      dataWebsite: dataWebsite ?? this.dataWebsite,
      dataDomain: dataDomain ?? this.dataDomain,
      dataHosting: dataHosting ?? this.dataHosting,
      dataApp: dataApp ?? this.dataApp,
      isHopDongApp: isHopDongApp ?? this.isHopDongApp,
      isHopDongWebsite: isHopDongWebsite ?? this.isHopDongWebsite,
      isHopDongDomain: isHopDongDomain ?? this.isHopDongDomain,
      isHopDongHosting: isHopDongHosting ?? this.isHopDongHosting,
      phieuThuModel: phieuThuModel ?? this.phieuThuModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}


final formPhieuThuProvider = NotifierProvider.autoDispose<PhieuThuNotifier, FormPhieuThuState>(() {
  return PhieuThuNotifier();
});

class PhieuThuNotifier extends AutoDisposeNotifier<FormPhieuThuState> {
  final PhieuThuRepository _phieuThuRepository = PhieuThuRepository();
  late final PhieuThuModel phieuThuModel;

  @override
  FormPhieuThuState build() {
    init();
    return FormPhieuThuState();
  }

  init() async {
    await taoMaKhachHang();
  }

  Future<String?> taoMaKhachHang() async {
    String? maKhachHang = await _phieuThuRepository.capMaKhachhang();
    maKhachHang =
    'NN$maKhachHang${DateTime.now().formatDateTime(formatString: 'yy')}';
    state = state.copyWith(maKhachHang: maKhachHang);
  }

  Future<PhieuThuModel?> initData({required String id}) async{
    final phieuThu = await _phieuThuRepository.chiTietPhieuThu(id: id);
    phieuThuModel = phieuThu!;
    await loadKhachHang();
    await loadHopDong();
    state = state.copyWith(phieuThuModel: phieuThuModel, isLoading: false);
    return phieuThu;
  }

  // Thông tin khách hàng
  // "KhachHang":{
  //   "makhachhang": "KH000002",
  //   "hoten": "Khách Hàng 002",
  //   "congty": "",
  //   "masothue": "",
  //   "cccd": "",
  //   "phone": "0090123213312",
  //   "email": "khachhang002@gmail.com",
  //   "diachi": "",
  //   "info": {
  //     "key": "value"
  //   },
  //   "ghichu": "",
  //   "type": "ca-nhan" // 'ca-nhan', 'cong-ty'
  // },
  loadKhachHang() async {
    final dataKhachHang = phieuThuModel.l1_khachhangId!.toJson();
    state = state.copyWith(dataKhachHang: dataKhachHang);
  }

  // Hợp đồng
  loadHopDong() async{
    final dataHopDong = {
      "tenhopdong":phieuThuModel.hopdong![0]['tenhopdong']
    };
    state = state.copyWith(soHopDong: phieuThuModel.hopdong![0]['sohopdong'],);
  }

  batDatSubmit() {
    state = state.copyWith(formStatus: FormStatus.submissionInProgress);
  }

  ketThucSubmit() {
    state = state.copyWith(formStatus: FormStatus.submissionCanceled);
  }

  checkLoaiHopDong(
      {bool? isHopDongWebsite,
        bool? isHopDongApp,
        bool? isHopDongDomain,
        bool? isHopDongHosting}) {
    if (isHopDongApp == true) {
      isHopDongWebsite = false;
      isHopDongDomain = false;
      isHopDongHosting = false;
    }

    if (isHopDongWebsite == true ||
        isHopDongDomain == true ||
        isHopDongHosting == true) {
      isHopDongApp = false;
    }

    state = state.copyWith(
      isHopDongApp: isHopDongApp ?? state.isHopDongApp,
      isHopDongHosting: isHopDongHosting ?? state.isHopDongHosting,
      isHopDongDomain: isHopDongDomain ?? state.isHopDongDomain,
      isHopDongWebsite: isHopDongWebsite ?? state.isHopDongWebsite,
    );
  }

  changeData(
      {required String type, required String key, required dynamic value}) {
    switch (type) {
      case 'khachhang':
        Map newDataKhachHang = state.dataKhachHang ?? {};
        newDataKhachHang.update(key, (item) => value, ifAbsent: () => value);
        state = state.copyWith(dataKhachHang: newDataKhachHang);
      case 'hopdong':
        Map newDataHopDong = state.dataHopDong ?? {};
        newDataHopDong.update(key, (item) => value, ifAbsent: () => value);
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

  saveForm() async {

  }
}
