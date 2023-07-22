import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/khach_hang_moi_repository.dart';

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
      state = result;
    }
    return null;
  }
}
