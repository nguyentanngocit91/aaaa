
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../_shared/utils/form_status.dart';
import '../models/danh_sach_blacklist_model.dart';
import '../repositories/blacklist_repository.dart';

part 'danh_sach_blacklist_state.dart';


final DanhsachBlackListReponsitory _danhsachBlackListReponsitory = DanhsachBlackListReponsitory();

// final DanhSachBlacklistProvider =
// NotifierProvider<DanhSachBlacklistNotifier, DanhSachBlacklistState>(() {
//   return PhieuthuNotifier();
// });

class DanhSachBlacklistNotifier extends Notifier<DanhSachBlacklistState> {



  @override
  DanhSachBlacklistState build() {
    getListBlacklist();
    return DanhSachBlacklistState().copyWith(listBlacklist: []);
  }

  Future<Map?> getListBlacklist() async {
    final result = await _danhsachBlackListReponsitory.getListBlacklist();
    if(result!=null){

      return result;
    }
    return null;
  }

}
final futureListBlackListProvider =
FutureProvider.autoDispose<List<DanhSachBlacklistModel>?>((ref) async {
  final List<DanhSachBlacklistModel> list = [];
  final response = await _danhsachBlackListReponsitory.getListBlacklist();

  if (response!= null) {
    if (response['success']) {
      for (var json in response['data']) {
          // print(json);
        list.add(DanhSachBlacklistModel.fromJson(json));
      }
    }
  }
  return list;
});

