import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import '../../../../../_shared/extensions/date_time_extention.dart';
import '../../../../../_shared/utils/form_status.dart';
import '../../../../../_shared/utils/helper.dart';
import '../models/media_result_model.dart';
import '../repositories/ds_hd_repository.dart';
import 'nhan_vien_phu_trach_provider.dart';



part 'form_them_phieuthu_state.dart';


final formThemPhieuThuProvider = NotifierProvider.autoDispose<FormThemPhieuThuNotifier, FormThemPhieuThuState>(() {
  return FormThemPhieuThuNotifier();
});

class FormThemPhieuThuNotifier extends AutoDisposeNotifier<FormThemPhieuThuState> {
  final DSHDRepository _dsHDRepository = DSHDRepository();
  @override
  FormThemPhieuThuState build() {
    return FormThemPhieuThuState();
  }

  batDatSubmit() {
    state = state.copyWith(status: FormStatus.submissionInProgress);
  }
  ketThucSubmit() {
    state = state.copyWith(status: FormStatus.submissionCanceled);
  }

  changeData(
      {required String type, required String key, required dynamic value}) {
    switch (type) {
      case 'phieuthu':
        Map newDataPhieuThu = state.dataPhieuThu ?? {};
        newDataPhieuThu.update(key, (item) => value, ifAbsent: () => value);
        state = state.copyWith(dataPhieuThu: newDataPhieuThu);
    }
  }

  void setFile(List data) {
    state = state.copyWith(uploadList: data);
  }

  changeFile({required PlatformFile file}){
    //state = state.copyWith(fileUpload: file);
  }

  Future<void> onSubmit(String _idContract, String _sohopdong) async {
    state = state.copyWith(loading: loadingStatus.START);
    List? uploadList = state.uploadList;
    final Map<String,dynamic> data = {};
    // format date
    const String formatDate = 'yyyy-MM-dd';

    print("${uploadList}+uploadList");
    if (uploadList !=null && uploadList.length > 0) {
      for (var item in uploadList) {
        var jsonResult = await _dsHDRepository.uploadFileNumberContract(
            sohopdong: _sohopdong,
            ghichu: item['note'],
            loaifile: item['type'],
            file: item['file']);

        if (jsonResult['success'] == false) {
          state = state.copyWith(
            loading: loadingStatus.STOP,
            success: jsonResult['status'],
            message: jsonResult['message'],
          );
          return;
        }
      }
    }

    // Danh sách nhân viên phụ trách
    final nhanViens = ref.read(nhanVienPhuTrachProvider).maNhanViens;
    final dsNhanVienPhuTrach =
    (nhanViens != null) ? [for (var nv in nhanViens) nv['manhanvien']] : [];

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

    data["PhieuThu"] = state.dataPhieuThu;


    print('data phieu thu: $data');



    final jsonResult =
    await _dsHDRepository.addPhieuThuContract(id: _idContract, data: data);
    List? file = state.uploadList;
    if(jsonResult['status']==true){
      file = [];
    }

      if (jsonResult['status']==true) {
       // final uploadedFile = await _saveFileHD();
       // state = state.copyWith(formStatus: FormStatus.submissionSuccess);

        state = state.copyWith(
            uploadList: file,
            loading: loadingStatus.STOP,
            success: jsonResult['status'],
            message: jsonResult['message'],
            status: FormStatus.submissionSuccess,
            result: jsonResult['data']);

      } else {
        //state = state.copyWith(formStatus: FormStatus.submissionFailure);

        state = state.copyWith(
            uploadList: file,
            loading: loadingStatus.STOP,
            success: jsonResult['status'],
            message: jsonResult['message'],
            status: FormStatus.submissionFailure,
            result: jsonResult['data']);
      }

    }



  void reset() {
    state = state.copyWith(
      success: false,
      message: '',
    );
  }


  xoaFile({required String id}){
    final List? danhSachMoi= state.uploadList?.where((element) => element.id.toString()!=id).toList();
    print("${danhSachMoi}+delete id");
    state = state.copyWith(uploadList: danhSachMoi);
  }
  clear() {
    //state = state.copyWith(fileHDModel: FileHDModel());
  }


}