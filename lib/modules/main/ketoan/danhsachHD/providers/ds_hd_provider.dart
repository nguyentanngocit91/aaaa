import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../_shared/utils/form_status.dart';
import '../../../../../_shared/utils/helper.dart';
import '../../../../../core/auth/providers/auth_provider.dart';
import '../repositories/ds_hd_repository.dart';
part 'ds_hd_state.dart';

final dshdProvider =
StateNotifierProvider<DSHDNotifier, DSHDState>(
      (ref) {
    return DSHDNotifier();
  },
);




class DSHDNotifier extends StateNotifier<DSHDState> {
  final DSHDRepository _dsHDRepository = DSHDRepository();
  DSHDNotifier() : super(const DSHDState());

  void onChangeValue(String type, String value) {
    Map<String, String> data = state.data ?? {};
    data.addAll({type: value});
    state = state.copyWith(data: data);
  }

  void cancelSearch() async {
    Map<String, String>? data = state.data;
  }

  void onSearch() async {
    Map<String, String>? data = state.data;
    print("data: ${data}");
    Map<String, dynamic> params = {
      'makhachhang': (data!=null && data['MAKH']!='')?data['MAKH']:'',
      'mahopdong': (data!=null && data['MAHD']!='')?data['MAHD']:'',
      'tenhopdong': (data!=null && data['TENHD']!='')?data['TENHD']:'',
      'email': (data!=null && data['EMAIL']!='')?data['EMAIL']:'',
    };

    final jsonResult = await _dsHDRepository.searchInfo(data: params);

    state = state.copyWith(
        result: jsonResult
    );

    print("${state.result}+000000");

  }
}