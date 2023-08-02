import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../_shared/utils/form_status.dart';
import '../models/contract_model.dart';
import '../models/media_model.dart';
import '../repositories/capnhat_repository.dart';
part 'capnhat_state.dart';

final capnhatProvider =
StateNotifierProvider.autoDispose<CapNhatNotifier, CapNhatState>(
      (ref) {
    return CapNhatNotifier();
  },
);

class CapNhatNotifier extends StateNotifier<CapNhatState> {
  final CapNhatRepository _capNhatRepository = CapNhatRepository();
  CapNhatNotifier() : super(const CapNhatState());
  int? perPage = 10;
  int currentPage = 1;
  String _search_type =  '';
  void onChangeValue(String type, String value) {
    Map<String, String> data = state.data ?? {};
    data.addAll({type: value});
    state = state.copyWith(data: data);
  }
  void setPerPage(int? number,String? type){
    this.perPage = number;
    if(type!=null) {
      onSearch(type);
    }
  }
  void reset(){
    state = state.copyWith(
        perPage: PaginatedDataTable.defaultRowsPerPage,
        currentPage: 1
    );
  }
  void setPage(int number,String? type){
    this.currentPage = number;
    if(type!=null) {
      onSearch(type);
    }
  }

  void reload() {
    this.onSearch(_search_type);
  }
  void onSearch(String type) async {
    _search_type = type;
    Map<String, String>? data = state.data;
    Map<String, dynamic> params = {
      'sohopdong': (data!=null && data['SOHD']!='')?data['SOHD']:'',
      'makhachhang': (data!=null && data['MAKH']!='')?data['MAKH']:'',
      'email': (data!=null && data['EMAIL']!='')?data['EMAIL']:'',
      'tenhopdong': (data!=null && data['TENHD']!='')?data['TENHD']:'',
      'loaihopdong': type,
      'limit':perPage,
      'page':currentPage
    };

    final jsonResult = await _capNhatRepository.searchInfo(data: params);
    state = state.copyWith(
        result: jsonResult,
        perPage: perPage,
        currentPage: currentPage
    );
    return;

    if(params['sohopdong']=='' && params['makhachhang']=='' && params['email']=='' && params['tenhopdong']==''){


      state = state.copyWith(
          result: null,
          perPage: perPage,
          currentPage: currentPage
      );

    }else {
      final jsonResult = await _capNhatRepository.searchInfo(data: params);
      state = state.copyWith(
          result: jsonResult,
          perPage: perPage,
          currentPage: currentPage
      );
    }


  }

  getConstractById(String id) async {
   state = state.copyWith(contract: null);
   final jsonResult = await _capNhatRepository.getInfo(id);
   state = state.copyWith(contract: jsonResult['data'],media:jsonResult['media']);
  }

}