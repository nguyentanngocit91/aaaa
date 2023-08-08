import '../../../../../_shared/utils/form_status.dart';
import '../models/domain_model.dart';

class DanhSachDomainMoiState{

  DanhSachDomainMoiState({ this.status= FormStatus.pure,this.statusUpdate= FormStatus.pure, this.domain, this.listDomain= const []});
  final FormStatus? status;
  final FormStatus? statusUpdate;
  final String? domain;
  final List<DomainModel> listDomain;

  DanhSachDomainMoiState copyWith({
    FormStatus? status,
    FormStatus? statusUpdate,
    String? domain,
    List<DomainModel>? listDomain,
  }) {
    return DanhSachDomainMoiState(
      status: status ?? this.status,
      statusUpdate: statusUpdate ?? this.statusUpdate,
      domain: domain ?? this.domain,
      listDomain: listDomain ?? this.listDomain,
    );
  }
}