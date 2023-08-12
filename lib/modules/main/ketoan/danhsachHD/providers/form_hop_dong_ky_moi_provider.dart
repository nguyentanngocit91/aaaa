import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import '../../../../../_shared/extensions/date_time_extention.dart';
import '../../../../../_shared/utils/form_status.dart';
import '../models/customerupdate_model.dart';
import '../repositories/hop_dong_ky_moi_repository.dart';
import 'danh_sach_domain_provider.dart';
import 'files_hd_provider.dart';
import 'kiem_tra_khach_hang_provider.dart';
import 'nhan_vien_phu_trach_provider.dart';

part 'form_hop_dong_ky_moi_state.dart';

final formHopDongKyMoiProvider = NotifierProvider.autoDispose<FormHopDongKyMoiNotifier, FormHopDongKyMoiState>(() {
  return FormHopDongKyMoiNotifier();
});

/*final formHopDongKyMoiProvider =
    NotifierProvider<FormHopDongKyMoiNotifier, FormHopDongKyMoiState>(() {
  return FormHopDongKyMoiNotifier();
});*/

/*class FormHopDongKyMoiNotifier extends Notifier<FormHopDongKyMoiState> {
  final HopDongKyMoiRepository _hopDongKyMoiRepository = HopDongKyMoiRepository();*/

class FormHopDongKyMoiNotifier extends AutoDisposeNotifier<FormHopDongKyMoiState> {
  final HopDongKyMoiRepository _hopDongKyMoiRepository = HopDongKyMoiRepository();

  late final CustomerUpdateModel customerUpdateModel;
  Map _res = {};

  @override
  FormHopDongKyMoiState build() {
    init();
    return FormHopDongKyMoiState();
  }

  init() async {
   //await taoMaKhachHang();
    await taoMaHopDong();
  }

  batDatSubmit() {
    state = state.copyWith(formStatus: FormStatus.submissionInProgress);
  }

  ketThucSubmit() {
    state = state.copyWith(formStatus: FormStatus.submissionCanceled);
  }


  Future<String?> taoMaKhachHang() async {
    String? maKhachHang = await _hopDongKyMoiRepository.capMaKhachhang();
    maKhachHang =
    'NN$maKhachHang${DateTime.now().formatDateTime(formatString: 'yy')}';
    state = state.copyWith(maKhachHang: maKhachHang);
  }

  Future<String?> taoMaHopDong() async {
    final soHopDong = await _hopDongKyMoiRepository.capSoHopDong();
    state = state.copyWith(soHopDong: soHopDong);
  }


  Future<CustomerUpdateModel?> initData({required String id}) async{
    final Map result = await _hopDongKyMoiRepository.chiTietKhachHang(id: id);
    if(result['success']==true){
      _res = result;

      //print("${result['data']}+ data kh");
      customerUpdateModel = CustomerUpdateModel.fromJson(result['data']);
      await loadKhachHang();
      state = state.copyWith(customer: customerUpdateModel, isLoading: false);
      return customerUpdateModel;
    }
    return null;
  }

  // Thông tin khách hàng
  loadKhachHang() async {

    Map<String, String> _typeInfo = {
      'email_phu': customerUpdateModel.info!.emailPhu!.toString(),
      'nguoidaidienmoi': customerUpdateModel.info!.nguoidaidienmoi!.toString(),
      'dienthoaicoquan':customerUpdateModel.info!.dienthoaicoquan!.toString(),
    };

    final dataKhachHang = {
      "makhachhang": customerUpdateModel.makhachhang.toString(),
      "hoten": customerUpdateModel.hoten.toString(),
      "congty": customerUpdateModel.congty.toString(),
      "masothue": customerUpdateModel.masothue.toString(),
      "cccd": customerUpdateModel.cccd.toString(),
      "phone": customerUpdateModel.phone.toString(),
      "email": customerUpdateModel.email.toString(),
      "diachi": customerUpdateModel.diachi.toString(),
      "info": _typeInfo,
      "ghichu": customerUpdateModel.ghichu.toString(),
    };
    state = state.copyWith(dataKhachHang: dataKhachHang);
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
      /*case 'khachhang':
        Map newDataKhachHang = state.dataKhachHang ?? {};
        newDataKhachHang.update(key, (item) => value, ifAbsent: () => value);
        state = state.copyWith(dataKhachHang: newDataKhachHang);*/
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
    // data
    final Map<String,dynamic> data = {};

    // format date
    const String formatDate = 'yyyy-MM-dd';

    // Thông tin Khách hàng
    /*  final thongTinKhachHangCu = ref.read(kiemTraKhachHangProvider).data;
    if (thongTinKhachHangCu!.isEmpty) {
      state.dataKhachHang?['makhachhang'] = state.maKhachHang;
      data["KhachHang"] = state.dataKhachHang;
    } else {
      data["KhachHang"] = thongTinKhachHangCu;
    }*/
    data["KhachHang"] = state.dataKhachHang;
    print('data KhachHang: $data["KhachHang"]');
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
      state.dataPhieuThu?['ngaynopcty'] =
          (state.dataPhieuThu?['ngaynopcty'] as DateTime)
              .formatDateTime(formatString: formatDate);
    }
    state.dataPhieuThu?['manhanvien'] = dsNhanVienPhuTrach;

    // thông tin hợp đồng website
    if (state.isHopDongWebsite) {
      if (state.dataWebsite?['ngaykyhd'] == null) {
        state.dataWebsite?['ngaykyhd'] =
            DateTime.now().formatDateTime(formatString: formatDate);
      } else {
        state.dataWebsite?['ngaykyhd'] =
            (state.dataWebsite?['ngaykyhd'] as DateTime)
                .formatDateTime(formatString: formatDate);
      }
      if (state.dataWebsite?['ngaybangiao'] != null) {
        state.dataWebsite?['ngaybangiao'] =
            (state.dataWebsite?['ngaybangiao'] as DateTime)
                .formatDateTime(formatString: formatDate);
      }
      data["Web"] = state.dataWebsite;
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
    }

    // Thông tin hợp đồng Hosting
    if (state.isHopDongHosting) {
      if (state.dataHosting?['ngaykyhd'] == null) {
        state.dataHosting?['ngaykyhd'] =
            DateTime.now().formatDateTime(formatString: formatDate);
      } else {
        state.dataHosting?['ngaykyhd'] =
            (state.dataHosting?['ngaykyhd'] as DateTime)
                .formatDateTime(formatString: formatDate);
      }
      if (state.dataHosting?['ngayhethan'] != null) {
        state.dataHosting?['ngayhethan'] =
            (state.dataHosting?['ngayhethan'] as DateTime)
                .formatDateTime(formatString: formatDate);
      }
      if (state.dataHosting?['trangthaihosting'] == null) {
        state.dataHosting?['trangthaihosting'] = 'kymoi';
      }
      data["Hosting"] = state.dataHosting;
    }

    // Thông tin hợp đồng App
    if (state.isHopDongApp) {
      if (state.dataApp?['ngaykyhd'] == null) {
        state.dataApp?['ngaykyhd'] =
            DateTime.now().formatDateTime(formatString: formatDate);
      } else {
        state.dataApp?['ngaykyhd'] = (state.dataApp?['ngaykyhd'] as DateTime)
            .formatDateTime(formatString: formatDate);
      }
      if (state.dataApp?['ngaybangiao'] != null) {
        state.dataApp?['ngaybangiao'] =
            DateTime.parse(state.dataApp?['ngaybangiao'])
                .formatDateTime(formatString: formatDate);
      }
      data["App"] = state.dataApp;
    }

    data["HopDong"] = state.dataHopDong;
    data["PhieuThu"] = state.dataPhieuThu;

     print('data: $data');

    final result = await _hopDongKyMoiRepository.luuHopDongMoi(data: data);

    if (result) {
      final uploadedFile = await _saveFileHD();
      state = state.copyWith(formStatus: FormStatus.submissionSuccess);
    } else {
      state = state.copyWith(formStatus: FormStatus.submissionFailure);
    }


  }

  Future<bool> _saveFileHD() async {
    final infoFile = ref.read(fileHDProvider);
    if (infoFile.fileUpload?.path != null) {
      return await _hopDongKyMoiRepository.updateFile(
          fileHDModel: infoFile,
          soHopDong: state.soHopDong.toString() ?? '011111');
    }
    return false;
  }

  Future<void> getInfoCustomerById(String id) async {
    state = state.copyWith(customer: null,);

    final jsonResult = await _hopDongKyMoiRepository.getInfoCustomerByID(id);
    print("${jsonResult['data']}+ customer");

    //print("${jsonResult['media']}+ media");
    state = state.copyWith(customer: jsonResult['data']);

    // print("${state.customer}+state.customer");

    // print("${state.media}+state.media");
  }


}
