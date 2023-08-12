import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_shared/extensions/date_time_extention.dart';
import '../../../../../_shared/utils/form_status.dart';
import '../providers/nhan_vien_phu_trach_provider.dart';
import '../models/phieu_thu_model.dart';
import '../repositories/phieu_thu_repository.dart';
import 'danh_sach_domain_provider.dart';

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
  Map _res = {};


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
    final Map result = await _phieuThuRepository.chiTietPhieuThu(id: id);
    if(result['success']==true){
      _res = result;
      phieuThuModel = PhieuThuModel.fromJson(result['PhieuThu']);
      await loadKhachHang();
      await loadHopDong();
      await loadPhieuThu();
      await loadNhanVien();
      state = state.copyWith(phieuThuModel: phieuThuModel, isLoading: false);
      return phieuThuModel;
    }
    return null;
  }

  // Thông tin khách hàng
  loadKhachHang() async {
    final dataKhachHang = {
      "makhachhang": phieuThuModel.l1_khachhangId!.makhachhang,
      "hoten": phieuThuModel.l1_khachhangId!.hoten,
      "congty": phieuThuModel.l1_khachhangId!.congty,
      "masothue": phieuThuModel.l1_khachhangId!.masothue,
      "cccd": phieuThuModel.l1_khachhangId!.cccd,
      "phone": phieuThuModel.l1_khachhangId!.phone,
      "email": phieuThuModel.l1_khachhangId!.email,
      "diachi": phieuThuModel.l1_khachhangId!.diachi,
      "info": phieuThuModel.l1_khachhangId!.info,
      "ghichu": phieuThuModel.l1_khachhangId!.ghichu,
    };
    state = state.copyWith(dataKhachHang: dataKhachHang);
  }

  // Hợp đồng
  loadHopDong() async{
    final jsonHd = _res['HopDong'];
    final dataHopDong = {
      "tenhopdong":phieuThuModel.hopdong![0]['tenhopdong'],
      "trangthaihosting":jsonHd?['trangthai_hosting'] ?? 'kymoi',
      'sohopdongcu':jsonHd?['sohopdongcu'] ?? ''
    };
    bool isHopDongWebsite = false;
    bool isHopDongHosting = false;
    bool isHopDongDomain = false;
    bool isHopDongApp = false;

    if(phieuThuModel.hopdong!.indexWhere((element) => element['loaihopdong']=='web')!=-1){
      isHopDongWebsite = true;
      loadDataWeb();
    }
    if(phieuThuModel.hopdong!.indexWhere((element) => element['loaihopdong']=='hosting')!=-1){
      isHopDongHosting = true;
      loadDataHosting();
    }

    int indexHDDomain = phieuThuModel.hopdong!.indexWhere((element) => element['loaihopdong']=='domain');
    if(indexHDDomain!=-1){
      isHopDongDomain = true;
      loadDataDomain();
    }
    if(phieuThuModel.hopdong!.indexWhere((element) => element['loaihopdong']=='app')!=-1){
      isHopDongApp = true;
      loadDataApp();
    }

    state = state.copyWith(soHopDong: phieuThuModel.hopdong![0]['sohopdong'], dataHopDong: dataHopDong, isHopDongWebsite: isHopDongWebsite, isHopDongApp: isHopDongApp, isHopDongDomain: isHopDongDomain, isHopDongHosting: isHopDongHosting);
  }

  // Thông tin Phiếu thu
  loadPhieuThu() async{
    final dataPhieuThu = {
      "maphieuthu": phieuThuModel.maphieuthu,
      "tongtien": phieuThuModel.tongtien,
      "tongtiendomain": tongTienDomain(),
      "phiweb": phieuThuModel.phiweb,
      "phinangcapweb": phieuThuModel.phinangcapweb,
      "phihosting": phieuThuModel.phihosting,
      "phinangcaphosting": phieuThuModel.phinangcaphosting,
      "phitenmien": phieuThuModel.phitenmien,
      "phiapp": phieuThuModel.phiapp,
      "vat": phieuThuModel.vat,
      "ngaynopcty": (phieuThuModel.ngaynopcty!=null) ? DateTime.parse(phieuThuModel.ngaynopcty.toString()) : null,
      "httt": phieuThuModel.httt,
      "ghichu": phieuThuModel.ghichu,
      "loaiphieuthu": phieuThuModel.loaiphieuthu,
      "info": phieuThuModel.info,
    };
    state = state.copyWith(dataPhieuThu: dataPhieuThu);
  }

  // Nhân viên phụ trách
  loadNhanVien() async{
    ref.read(nhanVienPhuTrachProvider.notifier).loadDanhSachNhanVien(danhSach: phieuThuModel.nhanvien ?? []);
  }

  // Thông tin hợp đồng Web
  loadDataWeb() {
    final json = _res['Web'];
    final dataWeb = {
      "chucnang": json['chucnang'],
      "mota": json['mota'],
      "tongtien": json['tongtien'],
      "ngaykyhd": (json['ngaykyhd']!=null) ? DateTime.parse(json['ngaykyhd']) : DateTime.now(),
      "ngaybangiao": (json['ngaybangiao']!=null) ? DateTime.parse(json['ngaybangiao']) : null,
      "ghichu": json['ghichu'],
    };
    state = state.copyWith(dataWebsite: dataWeb);
  }

  // Thông tin hợp đồng Domain
  loadDataDomain() {
    ref.read(danhSachDomainProvider.notifier).loadDanhSachDomain(danhSach: _res['Domain']);
  }

  int tongTienDomain(){
    int indexHDDomain = phieuThuModel.hopdong!.indexWhere((element) => element['loaihopdong']=='domain');
    if(indexHDDomain!=-1){
      return phieuThuModel.hopdong![indexHDDomain]['tongtien'];
    }
    return 0;
  }

  // Thông tin hợp đồng Hosting
  loadDataHosting() {
    final json = _res['Hosting'];
    final jsonHd = _res['HopDong'];
    final dataHosting = {
      "dungluong": json['dungluong'],
      "sonamdangky": json['sonamdangky'],
      "tongtien": json['tongtien'],
      "ngaykyhd": DateTime.parse(json['ngaykyhd']),
      "ngaykichhoat": (json['ngaykichhoat']!=null) ? DateTime.parse(json['ngaykichhoat']) : DateTime.now(),
      "ngayhethan": (json['ngayhethan']!=null) ? DateTime.parse(json['ngayhethan']) : null,
      "ghichu": json['ghichu'],
    };
    state = state.copyWith(dataHosting: dataHosting);
  }

  // Thông tin hợp đồng App
  loadDataApp() {
    final dataApp = {

    };
    state = state.copyWith(dataApp: dataApp);
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
