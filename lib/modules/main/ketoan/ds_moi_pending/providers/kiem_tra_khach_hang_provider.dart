import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/phieu_thu_repository.dart';
import 'sua_phieu_thu_provider.dart';

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
  final PhieuThuRepository _phieuThuRepository =
  PhieuThuRepository();

  @override
  KhachHangCuState build() {
    return KhachHangCuState();
  }

  Future<void> kiemTraThongTinKhachHang({required String email}) async {
    state = state.copyWith(loading: true, data: null);
    final Map? result =
        await _phieuThuRepository.thongTinKhachHang(email: email, type: '&type=single');
    if(result!=null){
      result.forEach((key, value) {
        ref.read(formPhieuThuProvider.notifier).changeData(type: 'khachhang', key: key, value: value);
      });
      state = state.copyWith(loading: false, data: result);
    }else{
      state = state.copyWith(loading: false, data: {});
    }
  }
}
