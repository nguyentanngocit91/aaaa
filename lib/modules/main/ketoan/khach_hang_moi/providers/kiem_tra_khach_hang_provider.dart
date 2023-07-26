import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/khach_hang_moi_repository.dart';
import 'form_khach_hang_moi_provider.dart';

class KhachHangCuState {
  final bool? loading;
  final Map? data;

  KhachHangCuState({this.loading = false, this.data});


  KhachHangCuState copyWith({bool? loading, Map? data}){
    return KhachHangCuState(
      loading: loading ?? this.loading,
      data: data ?? this.data,
    );
  }
}

final kiemTraKhachHangProvider =
    NotifierProvider<KiemTraKhachHangNotifier, KhachHangCuState>(() {
  return KiemTraKhachHangNotifier();
});

class KiemTraKhachHangNotifier extends Notifier<KhachHangCuState> {
  final KhachHangMoiRepository _khachHangMoiRepository =
      KhachHangMoiRepository();

  @override
  KhachHangCuState build() {
    return KhachHangCuState();
  }

  Future<void> kiemTraThongTinKhachHang({required String email}) async {
    state = state.copyWith(loading: true, data: null);
    final Map? result =
        await _khachHangMoiRepository.thongTinKhachHang(email: email);
    if(result!=null){
      result.forEach((key, value) {
        ref.read(formKhachHangMoiProvider.notifier).changeData(type: 'khachhang', key: key, value: value);
      });
      state = state.copyWith(loading: false, data: result);
    }else{
      state = state.copyWith(loading: false, data: {});
    }
  }
}
