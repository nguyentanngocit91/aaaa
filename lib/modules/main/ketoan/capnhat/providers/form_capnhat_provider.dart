import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../../_shared/utils/form_status.dart';
import '../../../../../_shared/thietlap_ngonngu.dart';
import '../../../../../_shared/utils/helper.dart';
import '../models/contract_model.dart';
import '../repositories/capnhat_repository.dart';
import '../repositories/upload_reponsitory.dart';

part 'form_capnhat_state.dart';

final formcapnhatProvider =
    StateNotifierProvider.autoDispose<FormCapNhatNotifier, CapNhatState>(
  (ref) {
    return FormCapNhatNotifier();
  },
);

class FormCapNhatNotifier extends StateNotifier<CapNhatState> {
  final CapNhatRepository _capNhatRepository = CapNhatRepository();
  final UploadRepository _uploadRepository = UploadRepository();

  FormCapNhatNotifier() : super(const CapNhatState());

  void onChangeValue(String type, String value) {
    Map<String, String> data = state.data ?? {};
    data.addAll({type: value});
    state = state.copyWith(data: data);
  }

  void setFile(List data) {
    state = state.copyWith(uploadList: data);
  }

  Future<void> onSubmit(String _id, String _contractNumber) async {
    state = state.copyWith(loading: loadingStatus.START);
    List? uploadList = state.uploadList;

    if (uploadList !=null && uploadList.length > 0) {
      for (var item in uploadList) {
        var jsonResult = await _uploadRepository.uploadFile(

            sohopdong: _contractNumber,
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
        await _capNhatRepository.update(id: _id, data: state.data);
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
