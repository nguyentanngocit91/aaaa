import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_shared/extensions/date_time_extention.dart';
import '../../../../../_shared/utils/form_status.dart';
import '../../../../../_shared/utils/helper.dart';
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
  final KhachHangMoiRepository _khachHangMoiRepository =
      KhachHangMoiRepository();

  @override
  FormKhachHangMoiState build() {
    return FormKhachHangMoiState();
  }

  changeType(
      {bool isWeb = false,
      bool isHost = false,
      bool isApp = false,
      bool isDomain = false}) {
    state = state.copyWith(
        isHopDongApp: isApp,
        isHopDongDomain: isDomain,
        isHopDongWebsite: isWeb,
        isHopDongHosting: isHost);
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

  getData({required String type, required String key}) {
    Map<String, Map?> data = {
      'khachhang': state.dataKhachHang,
      'hopdong': state.dataHopDong,
      'website': state.dataWebsite,
      'domain': state.dataDomain,
      'hosting': state.dataHosting,
      'app': state.dataApp,
    };
    dynamic xvalue = '';
    data[type]?.forEach((key2, value) {
      if (key == key2) {
        xvalue = value;
      }
    });
    return xvalue;
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

  saveForm(List uploadList) async {

    state = state.copyWith(loading: loadingStatus.START);


    final Map<String, dynamic> data = {};

    FormKhachHangMoiState state2 = state.copyWith();

    // format date
    const String formatDate = 'yyyy-MM-dd';

    // Danh sách nhân viên phụ trách
    final nhanViens = ref.read(nhanVienPhuTrachProvider).maNhanViens;
    final dsNhanVienPhuTrach =
        (nhanViens != null) ? [for (var nv in nhanViens) nv['manhanvien']] : [];




    // Thông tin Hợp đồng
    state.dataHopDong?['sohopdong'] = state.soHopDong;
    state.dataHopDong?['manhanvien'] = dsNhanVienPhuTrach;

    // Thông tin phiếu thu
    if (state.dataPhieuThu?['ngaynopcty'] == null) {
      state.dataPhieuThu?['ngaynopcty'] =
          DateTime.now().formatDateTime(formatString: formatDate);
    } else {
      state.dataPhieuThu?['ngaynopcty'] = Helper.saveDate(state.dataPhieuThu?['ngaynopcty']);

    }

    state.dataPhieuThu?['manhanvien'] = dsNhanVienPhuTrach;

    // thông tin hợp đồng website
    if (state.isHopDongWebsite) {
      if (state.dataWebsite?['ngaykyhd'] == null) {
        state.dataWebsite?['ngaykyhd'] =
            DateTime.now().formatDateTime(formatString: formatDate);
      } else {
        state.dataWebsite?['ngaykyhd'] =
            (DateTime.parse(state.dataWebsite?['ngaykyhd']))
                .formatDateTime(formatString: formatDate);
      }
      if (state.dataWebsite?['ngaybangiao'] != null) {
        if (DateTime.tryParse(state.dataWebsite?['ngaybangiao']) == null) {
          if (state.dataWebsite?['ngaybangiao'].toString() != 'null') {
            state.dataWebsite?['ngaybangiao'] = Helper.saveDate(
                    state.dataWebsite?['ngaybangiao']);

          }
        } else {
          state.dataWebsite?['ngaybangiao'] = Helper.saveDate(state.dataWebsite?['ngaybangiao']);

        }
      }
      data["Web"] = state.dataWebsite;
      data['idkhachhang'] = data['Web']['idkhachhang'];
      data['type'] = 'web';
    }

    // Thông tin hợp đồng Domain
    if (state.isHopDongDomain) {
      final dsDomain = ref.read(danhSachDomainProvider);
      List<Map> dataDomain = [];
      for (DomainModel item in dsDomain) {
        if (item.ngayKy == null) item = item.copyWith(ngayKy: DateTime.now());
        dataDomain.add(item.toJson());
      }
      data["Domain"] = dataDomain;
      data['idkhachhang'] = data['Domain']['idkhachhang'];
      data['type'] = 'domain';
    }

    // Thông tin hợp đồng Hosting

    if (state.isHopDongHosting) {
      data["Hosting"] = state.dataHosting;
      if (data["Hosting"]['ngaykyhd'] == null) {
        data["Hosting"]['ngaykyhd'] =
            DateTime.now().formatDateTime(formatString: formatDate);
      }
      data['Hosting']['tenhosting'] = (double.parse(data['Hosting']['dungluong']) / 1000).toString()+" GB";
      if (data["Hosting"]['ngayhethan'] != null) {

        if (DateTime.tryParse(data["Hosting"]['ngayhethan']!.toString()) ==
            true) {

          data["Hosting"]['ngayhethan'] = Helper.saveDate(data["Hosting"]['ngayhethan']);

        }else{
          data["Hosting"]['ngayhethan'] = Helper.saveDate(data["Hosting"]['ngayhethan']);
        }
      }
      if (data["Hosting"]['ngaydangky'] != null) {

        if (DateTime.tryParse(data["Hosting"]['ngaydangky']!.toString()) ==
            true) {

          data["Hosting"]['ngaydangky'] =
              (DateTime.parse(data["Hosting"]['ngaydangky']))
                  .formatDateTime(formatString: formatDate);
        }else{
          print(data["Hosting"]['ngaydangky']);
          data["Hosting"]['ngaydangky'] = Helper.saveDate(data["Hosting"]['ngaydangky']);
        }
      }
      if (state.dataHosting?['trangthai_hosting'] == null) {
        state.dataHosting?['trangthai_hosting'] = 'nangcap';
      }

      data['idkhachhang'] = data['Hosting']['idkhachhang'];
      data['type'] = 'hosting';
    }

    // Thông tin hợp đồng App
    if (state.isHopDongApp) {
      if (state.dataApp?['ngaykyhd'] == null) {
        state.dataApp?['ngaykyhd'] =
            DateTime.now().formatDateTime(formatString: formatDate);
      } else {
        state.dataApp?['ngaykyhd'] = Helper.saveDate(state.dataApp?['ngaykyhd']);
      }
      if (state.dataApp?['ngaybangiao'] != null) {
        state.dataApp?['ngaybangiao'] =
            (state.dataApp?['ngaybangiao'] as DateTime)
                .formatDateTime(formatString: formatDate);
      }
      data["App"] = state.dataApp;
      data['idkhachhang'] = data['App']['idkhachhang'];
      data['type'] = 'app';
    }

    data["HopDong"] = state.dataHopDong;
    data["PhieuThu"] = state.dataPhieuThu;

    data['UploadList'] = uploadList;
   // print(data);
    final result = await _khachHangMoiRepository.nangcapHD(data: data);
    //print(result);
  //  return;
    state = state.copyWith(loading: loadingStatus.STOP, response: result);
   // print("result response");
    if (result['status'] == false) {}
    //
    // if(result){
    //   final uploadedFile = await _saveFileHD();
    //   state = state.copyWith(formStatus: FormStatus.submissionSuccess);
    // }else {
    //   state = state.copyWith(formStatus: FormStatus.submissionFailure);
    // }
  }

  Future<bool> _saveFileHD() async {
    final infoFile = ref.read(fileHDProvider);
    if (infoFile.fileUpload?.path != null) {
      return await _khachHangMoiRepository.updateFile(
          fileHDModel: infoFile,
          soHopDong: state.soHopDong.toString() ?? '011111');
    }
    return false;
  }
}
