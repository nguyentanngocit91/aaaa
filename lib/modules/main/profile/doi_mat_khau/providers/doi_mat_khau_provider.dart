import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_shared/utils/form_status.dart';
import '../repositories/doi_mat_khau_repository.dart';
import 'doi_mat_khau_state.dart';

final doimatKhauProvider = NotifierProvider<DoiMatKhauNotifier,DoiMatKhauState>(() {
  return DoiMatKhauNotifier();
});

class DoiMatKhauNotifier extends Notifier<DoiMatKhauState> {
  final DoiMatKhauRepository _doiMatKhauRepository = DoiMatKhauRepository();

  @override
  DoiMatKhauState build() {
    return DoiMatKhauState();
  }

  capNhatMatKhauCu(String value){
    state = state.copyWith(matKhauCu: value);
  }

  capNhatMatKhauMoi(String value){
    state = state.copyWith(matKhauMoi: value);
  }

  capNhatLaiMatKhau() async{
    state = state.copyWith(formStatus: FormStatus.submissionInProgress);
    final result = await _doiMatKhauRepository.capNhatMatKhau(data: {
      "newPassword": state.matKhauMoi,
      "oldPassword": state.matKhauCu
    });
    if(result['success']==true){
      state = state.copyWith(formStatus: FormStatus.submissionSuccess, message: result['message']);
    }else{
      state = state.copyWith(formStatus: FormStatus.submissionFailure, message: result['message']);
    }
  }
}