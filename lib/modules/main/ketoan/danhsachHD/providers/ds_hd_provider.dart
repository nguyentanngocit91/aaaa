import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../_shared/utils/form_status.dart';
import '../models/customerupdate_model.dart';
import '../models/item_phieuthu_result_model.dart';
import '../models/mediacustomer_model.dart';
import '../repositories/ds_hd_repository.dart';
part 'ds_hd_state.dart';



final dshdProvider =
StateNotifierProvider.autoDispose<DSHDNotifier, DSHDState>(
      (ref) {
    return DSHDNotifier();
  },
);


class DSHDNotifier extends StateNotifier<DSHDState> {
  final DSHDRepository _dsHDRepository = DSHDRepository();
  DSHDNotifier() : super(const DSHDState());


  initSearchContract() async {
    await onSearch();
  }

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
    state = state.copyWith(result: null);
    state = state.copyWith(data: null);
  }
  void reload() {
    this.onSearch();
  }

   onSearch() async {
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
    return;
  }


  getDSPhieuThuById(String id) async {
    state = state.copyWith(listPhieuThu: null);
    final jsonResult = await _dsHDRepository.getInfoPhieuThu(id);
    state = state.copyWith(listPhieuThu: jsonResult['data'],status: FormStatus.submissionSuccess);
   // print("${jsonResult['data']}+ data 000000");
  }
   updateContractById(String id,String? tenHD,String? tongTien) async {
    //print("tongTien ${tongTien}");

    state = state.copyWith(status: FormStatus.submissionInProgress);

    final jsonResult = await _dsHDRepository.updateInfoContract(id: id,data: {
      "tenhopdong": (tenHD!=null && tenHD!='')?tenHD:'',
      "tongtien": (tongTien!=null && tongTien!='')?tongTien:'',
    });
   // print("data success: ${jsonResult['success']}");

    if(jsonResult['success']==true){
      state = state.copyWith(status: FormStatus.submissionSuccess, errorMessage: jsonResult['message']);
      initSearchContract();
    }else{
      state = state.copyWith(status: FormStatus.submissionFailure, errorMessage: jsonResult['message']);
    }
  }




  getCustomerById(String id) async {
    state = state.copyWith(customer: null);
    final jsonResult = await _dsHDRepository.getInfoCustomer(id);
    print("${jsonResult['data']}+ customer");


    //print("${jsonResult['media']}+ media");
    state = state.copyWith(customer: jsonResult['data'],media:jsonResult['media']);

  // print("${state.customer}+state.customer");

   // print("${state.media}+state.media");
  }


  updateMedia(Map<dynamic, String?> map) async {
    return await _dsHDRepository.updateMedia(map);
  }


}