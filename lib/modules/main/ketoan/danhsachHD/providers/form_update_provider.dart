import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_shared/utils/form_status.dart';
import '../../../../../_shared/utils/helper.dart';
import '../repositories/ds_hd_repository.dart';

part 'form_update_state.dart';

final formUpdateProvider =
StateNotifierProvider.autoDispose<FormUpdateNotifier, FormUpdateState>(
      (ref) {
    return FormUpdateNotifier();
  },
);


class FormUpdateNotifier extends StateNotifier<FormUpdateState> {
  final DSHDRepository _dsHDRepository = DSHDRepository();

  FormUpdateNotifier() : super(const FormUpdateState());

  void onChangeValue(String type, String value) {
    Map<String, String> data = state.data ?? {};
    data.addAll({type: value});
    state = state.copyWith(data: data);
  }

  void setFile(List data) {
    state = state.copyWith(uploadList: data);
  }

  Future<void> onSubmit(String _id, String _customerNumber) async {
    state = state.copyWith(loading: loadingStatus.START);
    List? uploadList = state.uploadList;

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
    Map data = state.data!;
    data.forEach((key, value) {
      if (key == "ngaykyhd" || key == "ngaybangiao") {
        data[key] = Helper.saveDate(value);
      }
    });
    data.removeWhere((key, value) => key == "mahopdong");

    final jsonResult =
    await _dsHDRepository.updateInfoCustomer(id: _id, data: state.data);
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
