import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_shared/utils/form_status.dart';
import '../models/domain_model.dart';
import '../repositories/domain_repository.dart';
import 'danh_sach_domain_moi_state.dart';

final DomainRepository _domainRepository = DomainRepository();

final dsDomainMoiProvider =
NotifierProvider<DanhSachDomainMoiNotifier, DanhSachDomainMoiState>(() {
  return DanhSachDomainMoiNotifier();
});

class DanhSachDomainMoiNotifier extends Notifier<DanhSachDomainMoiState> {



  @override
  DanhSachDomainMoiState build() {
    return DanhSachDomainMoiState(status: FormStatus.submissionInProgress);
  }

  init() async {
    await getListDomain();
  }

  void resetInputSearch() async{
    state = state.copyWith(domain: '',status: FormStatus.pure);
    //await getListPhieuThu();

  }

  void setInputDomain({required String? domain}){
    if(domain!=null) {
      state = state.copyWith(domain: domain);
    }
  }

  Future<void> actionRegisterDomain({required String? idDomain}) async {
    final response = await _domainRepository.registerDomain(idDomain:idDomain);


  }

  Future<void> actionInputSearch() async {
    var domain = state.domain;
    List<DomainModel> listDomain = [];

    domain ??= '';


    state = state.copyWith(status: FormStatus.submissionInProgress,listDomain: []);
    List<DomainModel>? temp = await searchDomain( domain:  domain);
    if(temp!=null) {
      listDomain = temp;
    }
    state = state.copyWith(status: FormStatus.submissionSuccess);
    state = state.copyWith(listDomain: listDomain);

  }

  Future<List<DomainModel>?> searchDomain({String domain = ''}) async {
    final List<DomainModel> list = [];
    final response = await _domainRepository.searchListDomain(domain: domain);
    if (response!= null) {
      if (response['success']) {
        for (var json in response['data']) {
          list.add(DomainModel.fromJson(json));
        }
        return list;
      }
    }
    return null;
  }


  Future<void> getListDomain() async {
    final List<DomainModel> list = [];
    final response = await _domainRepository.getListDomain();
    if (response!= null) {
      if (response['success']) {
        for (var json in response['data']) {
          list.add(DomainModel.fromJson(json));
        }
      }
    }
    state = state.copyWith(listDomain: list,status: FormStatus.submissionSuccess);
  }

}
