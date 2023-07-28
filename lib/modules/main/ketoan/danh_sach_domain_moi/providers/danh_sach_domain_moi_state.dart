import '../../../../../_shared/utils/form_status.dart';
import '../models/domain_model.dart';

class DanhSachDomainMoiState{

  DanhSachDomainMoiState({ this.status= FormStatus.pure, this.domain, this.listDomain= const []});
  final FormStatus? status;
  final String? domain;
  final List<DomainModel> listDomain;

  DanhSachDomainMoiState copyWith({
    FormStatus? status,
    String? domain,
    List<DomainModel>? listDomain,
  }) {
    return DanhSachDomainMoiState(
      status: status ?? this.status,
      domain: domain ?? this.domain,
      listDomain: listDomain ?? this.listDomain,
    );
  }
}