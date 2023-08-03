import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_shared/extensions/date_time_extention.dart';
import '../../../../../_shared/utils/form_status.dart';
import '../repositories/khach_hang_moi_repository.dart';
import 'danh_sach_domain_provider.dart';
import 'files_hd_provider.dart';
import 'kiem_tra_khach_hang_provider.dart';
import 'nhan_vien_phu_trach_provider.dart';

part 'form_khach_hang_moi_state.dart';

final formKhachHangMoiProvider =
    NotifierProvider<FormKhachHangMoiNotifier, FormKhachHangMoiState>(() {
  return FormKhachHangMoiNotifier();
});

class FormKhachHangMoiNotifier extends Notifier<FormKhachHangMoiState> {
  final KhachHangMoiRepository _khachHangMoiRepository = KhachHangMoiRepository();

  @override
  FormKhachHangMoiState build() {
    init();
    return FormKhachHangMoiState();
  }

  init() async {
    await taoMaKhachHang();
    await taoMaHopDong();
  }

  batDatSubmit(){
    state = state.copyWith(formStatus: FormStatus.submissionInProgress);
  }

  ketThucSubmit(){
    state = state.copyWith(formStatus: FormStatus.submissionCanceled);
  }

  Future<String?> taoMaKhachHang() async {
    String? maKhachHang = await _khachHangMoiRepository.capMaKhachhang();
    maKhachHang = 'NN$maKhachHang${DateTime.now().formatDateTime(formatString: 'yy')}';
    state = state.copyWith(maKhachHang: maKhachHang);
  }

  Future<String?> taoMaHopDong() async {
    final soHopDong = await _khachHangMoiRepository.capSoHopDong();
    state = state.copyWith(soHopDong: soHopDong);
  }

  checkLoaiHopDong(
      {bool? isHopDongWebsite,
      bool? isHopDongApp,
      bool? isHopDongDomain,
      bool? isHopDongHosting}) {

    if(isHopDongApp==true){
      isHopDongWebsite = false;
      isHopDongDomain = false;
      isHopDongHosting = false;
    }

    if(isHopDongWebsite==true || isHopDongDomain==true || isHopDongHosting==true){
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
    switch(type){
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

  saveForm() async{
    // data
    Map data = {};

    // format date
    const String formatDate = 'yyyy-MM-dd';

    // Thông tin Khách hàng
    final thongTinKhachHangCu = ref.read(kiemTraKhachHangProvider).data;
    if (thongTinKhachHangCu!.isEmpty) {
      state.dataKhachHang?['makhachhang'] = state.maKhachHang;
      data["KhachHang"] = state.dataKhachHang;
    }else{
      data["KhachHang"] = thongTinKhachHangCu;
    }

    // Danh sách nhân viên phụ trách
    final nhanViens = ref.read(nhanVienPhuTrachProvider).maNhanViens;
    final dsNhanVienPhuTrach = (nhanViens!=null) ? [
      for(var nv in nhanViens) nv['manhanvien']
    ] : [];

    // Thông tin Hợp đồng
    state.dataHopDong?['sohopdong'] = state.soHopDong;
    state.dataHopDong?['manhanvien'] = dsNhanVienPhuTrach;

    // Thông tin phiếu thu
    if(state.dataPhieuThu?['ngaynopcty']==null){
      state.dataPhieuThu?['ngaynopcty'] = DateTime.now().formatDateTime(formatString: formatDate);
    }else{
      state.dataPhieuThu?['ngaynopcty'] = (state.dataPhieuThu?['ngaynopcty'] as DateTime).formatDateTime(formatString: formatDate);
    }
    state.dataPhieuThu?['manhanvien'] = dsNhanVienPhuTrach;

    // thông tin hợp đồng website
    if(state.isHopDongWebsite){
      if(state.dataWebsite?['ngaykyhd']==null){
        state.dataWebsite?['ngaykyhd'] = DateTime.now().formatDateTime(formatString: formatDate);
      }else{
        state.dataWebsite?['ngaykyhd'] = (state.dataWebsite?['ngaykyhd'] as DateTime).formatDateTime(formatString: formatDate);
      }
      if(state.dataWebsite?['ngaybangiao']!=null){
        state.dataWebsite?['ngaybangiao'] = (state.dataWebsite?['ngaybangiao'] as DateTime).formatDateTime(formatString: formatDate);
      }
      data["Web"] = state.dataWebsite;
    }

    // Thông tin hợp đồng Domain
    if(state.isHopDongDomain){
      final dsDomain = ref.read(danhSachDomainProvider);
      List<Map> dataDomain = [];
      for(DomainModel item in dsDomain){
        if(item.ngayKy == null) item = item.copyWith(ngayKy: DateTime.now());
        dataDomain.add(item.toJson());
      }
      data["Domain"] = dataDomain;
    }

    // Thông tin hợp đồng Hosting
    if(state.isHopDongHosting){
      if(state.dataHosting?['ngaykyhd']==null){
        state.dataHosting?['ngaykyhd'] = DateTime.now().formatDateTime(formatString: formatDate);
      }else{
        state.dataHosting?['ngaykyhd'] = (state.dataHosting?['ngaykyhd'] as DateTime).formatDateTime(formatString: formatDate);
      }
      if(state.dataHosting?['ngayhethan']!=null){
        state.dataHosting?['ngayhethan'] = (state.dataHosting?['ngayhethan'] as DateTime).formatDateTime(formatString: formatDate);
      }
      if(state.dataHosting?['trangthaihosting']==null){
        state.dataHosting?['trangthaihosting'] = 'kymoi';
      }
      data["Hosting"] = state.dataHosting;
    }

    // Thông tin hợp đồng App
    if(state.isHopDongApp){
      if(state.dataApp?['ngaykyhd']==null){
        state.dataApp?['ngaykyhd'] = DateTime.now().formatDateTime(formatString: formatDate);
      }else{
        state.dataApp?['ngaykyhd'] = (state.dataApp?['ngaykyhd'] as DateTime).formatDateTime(formatString: formatDate);
      }
      if(state.dataApp?['ngaybangiao']!=null){
        state.dataApp?['ngaybangiao'] = (state.dataApp?['ngaybangiao'] as DateTime).formatDateTime(formatString: formatDate);
      }
      data["App"] = state.dataApp;
    }

    data["HopDong"] = state.dataHopDong;
    data["PhieuThu"] = state.dataPhieuThu;

    final result = await _khachHangMoiRepository.luuHopDongMoi(data: data);
    final uploadFiled = await saveFileHD();

    if(result==true){
      state = state.copyWith(formStatus: FormStatus.submissionSuccess);
    }else{
      state = state.copyWith(formStatus: FormStatus.submissionFailure);
    }
  }

  Future<bool> saveFileHD() async{
    final infoFile = ref.read(fileHDProvider);
    if(infoFile.fileUpload?.path!=null){
      return await _khachHangMoiRepository.updateFile(fileHDModel: infoFile, soHopDong: state.soHopDong.toString());
    }
    return false;
  }
}
