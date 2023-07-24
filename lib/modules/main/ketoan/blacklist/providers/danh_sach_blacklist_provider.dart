
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../_shared/utils/form_status.dart';

part 'danh_sach_blacklist_state.dart';


final DanhSachBlacklistProvider =
NotifierProvider<DanhSachBlacklistNotifier, DanhSachBlacklistState>(() {
  return DanhSachBlacklistNotifier();
});


class DanhSachBlacklistNotifier extends Notifier<DanhSachBlacklistState>{
  @override
  DanhSachBlacklistState build() {
    // TODO: implement build

    return DanhSachBlacklistState();
  }

}
