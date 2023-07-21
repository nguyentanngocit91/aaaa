import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../_shared/utils/form_status.dart';
import '../../../../../_shared/utils/helper.dart';
import '../../../../../core/auth/providers/auth_provider.dart';
import '../repositories/capnhat_repository.dart';
part 'capnhat_state.dart';

final capnhatProvider =
StateNotifierProvider<CapNhatNotifier, CapNhatState>(
      (ref) {
    return CapNhatNotifier();
  },
);

class CapNhatNotifier extends StateNotifier<CapNhatState> {
  final CapNhatRepository _capNhatRepository = CapNhatRepository();
  CapNhatNotifier() : super(const CapNhatState());

  void onChangeValue(String type, String value) {
    Map<String, String> data = state.data ?? {};
    data.addAll({type: value});
    state = state.copyWith(data: data);
  }

  void onSearch(String type) async {
    Map<String, String>? data = state.data;
    print("data: ${data}");
    Map<String, dynamic> params = {
      'mahopdong': (data!=null && data['MAHD']!='')?data['MAHD']:'',
      'makhachhang': (data!=null && data['MAKH']!='')?data['MAKH']:'',
      'email': (data!=null && data['EMAIL']!='')?data['EMAIL']:'',
      'loaihopdong': type,
    };

    final jsonResult = await _capNhatRepository.searchInfo(data: params);

    state = state.copyWith(
      result: jsonResult
    );

  }
}