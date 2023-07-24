import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/khach_hang_moi_repository.dart';
import 'form_khach_hang_moi_provider.dart';

final kiemTraKhachHangProvider = NotifierProvider<KiemTraKhachHangNotifier, Map?>(() {
  return KiemTraKhachHangNotifier();
});

class KiemTraKhachHangNotifier extends Notifier<Map?> {
  final KhachHangMoiRepository _khachHangMoiRepository = KhachHangMoiRepository();

  @override
  Map? build() {
    return {};
  }

  Future<Map?> kiemTraThongTinKhachHang({required String email}) async {
    final result = await _khachHangMoiRepository.thongTinKhachHang(email: email);
    if(result!=null){
      result.forEach((key, value) {
        ref.read(formKhachHangMoiProvider.notifier).changeData(type: 'khachhang', key: key, value: value);
      });
    }
    state = result;
    return null;
  }
}
