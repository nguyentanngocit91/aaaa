import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_shared/utils/form_status.dart';

part 'form_khach_hang_moi_state.dart';

final formKhachHangMoiProvider =
    NotifierProvider<FormKhachHangMoiNotifier, FormKhachHangMoiState>(() {
  return FormKhachHangMoiNotifier();
});

class FormKhachHangMoiNotifier extends Notifier<FormKhachHangMoiState> {
  @override
  FormKhachHangMoiState build() {
    return FormKhachHangMoiState();
  }

  checkLoaiHopDong(
      {bool? isHopDongWebsite,
      bool? isHopDongApp,
      bool? isHopDongDomain,
      bool? isHopDongHosting}) {
    state = state.copyWith(
      isHopDongApp: isHopDongApp ?? state.isHopDongApp,
      isHopDongHosting: isHopDongHosting ?? state.isHopDongHosting,
      isHopDongDomain: isHopDongDomain ?? state.isHopDongDomain,
      isHopDongWebsite: isHopDongWebsite ?? state.isHopDongWebsite,
    );
  }

  changeData({required String key, required dynamic value}) {
    Map newData = state.data ?? {};
    newData.update(key, (item) => value, ifAbsent: () => value);
    state = state.copyWith(data: newData);
  }

  saveForm() {
    if (state.data != null) {
      state.data!.forEach((key, value) {
        print('{"$key":"$value"}');
      });
    }
  }
}
