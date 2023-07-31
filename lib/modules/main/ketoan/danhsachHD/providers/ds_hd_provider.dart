import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../_shared/utils/form_status.dart';
import '../../../../../_shared/utils/helper.dart';
import '../../../../../core/auth/providers/auth_provider.dart';
import '../models/item_phieuthu_result_model.dart';
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


  void onUpdateContractValue(String type, String value) {
    Map<String, String> data = state.data ?? {};
    data.addAll({type: value});
    state = state.copyWith(data: data);
  }

  void cancelSearch() async {
    Map<String, String>? data = state.data;
  }

  void onSearch() async {
    Map<String, String>? data = state.data;
    //print("data: ${data}");
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

    //print("${state.result}+000000");

  }


  getDSPhieuThuById(String id) async {
    state = state.copyWith(listPhieuThu: null);
    final jsonResult = await _dsHDRepository.getInfoPhieuThu(id);
    state = state.copyWith(listPhieuThu: jsonResult['data'],status: FormStatus.submissionSuccess);
    print("${jsonResult['data']}+ data 000000");
    //state = state.copyWith(phieuthu: jsonResult['data']);

   // print("${state.listPhieuThu}+000000");
  }



  void updateContractById(String id) async {
    Map<String, String>? data = state.data;
    print("data UPDATE HD: ${data}");
    Map<String, dynamic> params = {
      'tenhopdong': (data!=null && data['TENHD']!='')?data['TENHD']:'',
      'tongtien': (data!=null && data['TONGTIEN']!='')?data['TONGTIEN']:'',
    };

    final jsonResult = await _dsHDRepository.updateInfoContract(id: id,data: params);

    if(jsonResult['success']==true){
      state = state.copyWith(status: FormStatus.submissionSuccess, errorMessage: jsonResult['message']);
    }else{
      state = state.copyWith(status: FormStatus.submissionFailure, errorMessage: jsonResult['message']);
    }

  }

}