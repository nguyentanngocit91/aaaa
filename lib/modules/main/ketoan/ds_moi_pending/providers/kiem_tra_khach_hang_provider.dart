import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/phieu_thu_repository.dart';


class KhachHangCuState {
  final bool? loading;
  final Map? data;
  final String err;
  final String errPhu;

  KhachHangCuState({this.loading = false, this.data, this.err = '', this.errPhu = ''});


  KhachHangCuState copyWith({bool? loading, Map? data, String? err, String? errPhu}){
    return KhachHangCuState(
      loading: loading ?? this.loading,
      data: data ?? this.data,
      err: err ?? this.err,
      errPhu: errPhu ?? this.errPhu
    );
  }
}

final kiemTraKhachHangProvider =
    NotifierProvider<KiemTraKhachHangNotifier, KhachHangCuState>(() {
  return KiemTraKhachHangNotifier();
});

class KiemTraKhachHangNotifier extends Notifier<KhachHangCuState> {
  final PhieuThuRepository _phieuThuRepository =
  PhieuThuRepository();

  @override
  KhachHangCuState build() {
    return KhachHangCuState();
  }

  Future<void> kiemTraThongTinKhachHang({required String email, required String maKhachHang,required String typeErr}) async {
    state = state.copyWith(loading: true);
    final bool result = await _phieuThuRepository.kiemTraEmailKhachHang(email: email, maKhachHang: maKhachHang);
    if(typeErr == 'email'){
      if(result==false){
        state = state.copyWith(err: 'Email này bị trùng với khách hàng khác');
      }else{
        state = state.copyWith(err: '');
      }
    }else{
      if(result==false){
        state = state.copyWith(errPhu: 'Email này bị trùng với khách hàng khác');
      }else{
        state = state.copyWith(errPhu: '');
      }
    }
    state = state.copyWith(loading: false);
  }
}
