import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/hop_dong_ky_moi_repository.dart';
import 'form_hop_dong_ky_moi_provider.dart';

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
  final HopDongKyMoiRepository _hopDongKyMoiRepository =
  HopDongKyMoiRepository();

  @override
  KhachHangCuState build() {
    return KhachHangCuState();
  }

  Future<void> kiemTraThongTinKhachHang({required String id}) async {
    state = state.copyWith(loading: true, data: null);
    final Map? result = await _hopDongKyMoiRepository.thongTinKhachHang(id: id);

    print("${result}+result----");

    if(result!=null){
      result.forEach((key, value) {
        ref.read(formHopDongKyMoiProvider.notifier).changeData(type: 'khachhang', key: key, value: value);
      });

      print("${result}+ data result----");
      state = state.copyWith(loading: false, data: result);
    }else{
      state = state.copyWith(loading: false, data: {});
    }
  }
}
