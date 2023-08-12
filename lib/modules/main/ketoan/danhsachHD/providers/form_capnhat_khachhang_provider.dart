import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_shared/utils/form_status.dart';
import '../../../../../_shared/utils/helper.dart';
import '../repositories/ds_hd_repository.dart';

part 'form_capnhat_khachhang_state.dart';

final formCapNhatKhachHangProvider =
StateNotifierProvider.autoDispose<FormCapNhatKhachHangNotifier, FormCapNhatKhachHangState>(
      (ref) {
    return FormCapNhatKhachHangNotifier();
  },
);
class FormCapNhatKhachHangNotifier extends StateNotifier<FormCapNhatKhachHangState> {
  final DSHDRepository _dsHDRepository = DSHDRepository();

  FormCapNhatKhachHangNotifier() : super(const FormCapNhatKhachHangState());

  void onChangeValue(String type, String value) {
    Map<String, String> data = state.data ?? {};
    data.addAll({type: value});
    state = state.copyWith(data: data);
  }

  changeData(
      {required String type, required String key, required dynamic value}) {
    switch (type) {
      case 'khachhang':
       Map newDataKhachHang = state.dataKhachHang ?? {};
       newDataKhachHang.update(key, (item) => value, ifAbsent: () => value);
        state = state.copyWith(dataKhachHang: newDataKhachHang);
    }

    print("${state.dataKhachHang }+state data info");
  }

  void setFile(List data) {
    state = state.copyWith(uploadList: data);
  }

  changeFile({required PlatformFile file}){
    //state = state.copyWith(fileUpload: file);
  }

  Future<void> onSubmit(String _id, String _customerNumber) async {
    state = state.copyWith(loading: loadingStatus.START);
    List? uploadList = state.uploadList;

    //print("${uploadList}+uploadList");

    if (uploadList !=null && uploadList.length > 0) {
      for (var item in uploadList) {
        var jsonResult = await _dsHDRepository.uploadFileCustomer(
            khachhangId: _id,
            makhachhang: _customerNumber,
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
  //  Map data = state.data!;
    Map? data = state.dataKhachHang!;
    data.removeWhere((key, value) => key == "makhachhang");

    final Map<String,dynamic> dataCustomer = {};
    dataCustomer["data"] = state.dataKhachHang;
    print("${state.dataKhachHang}+state.data update kh");

    final jsonResult =
    await _dsHDRepository.updateInfoCustomer(id: _id, data: dataCustomer);
    List? file = state.uploadList;
    if(jsonResult['status']==true){
      file = [];
    }

    state = state.copyWith(
        uploadList: file,
        loading: loadingStatus.STOP,
        success: jsonResult['status'],
        message: jsonResult['message'],
        result: jsonResult['data']);
  }

  void reset() {
    state = state.copyWith(
      success: false,
      message: '',
    );
  }




}
