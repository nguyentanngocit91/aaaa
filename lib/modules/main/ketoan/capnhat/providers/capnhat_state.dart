part of 'capnhat_provider.dart';
class CapNhatState{
  final Map<String,String>? data;
  final FormStatus status;
  final String? errorMessage;
  final Map<String,dynamic>? result;
  final int perPage;
  final int currentPage;
  final bool loading;
  final ContractModel? contract;


  const CapNhatState({
    this.data = null,
    this.status = FormStatus.pure,
    this.errorMessage = '',
    this.result = null,
    this.perPage = 10,
    this.currentPage = 1,
    this.loading = false,
    this.contract = null,
  });

  CapNhatState copyWith({

    Map<String,String>? data,
    FormStatus? status,
    String? errorMessage,
    Map<String,dynamic>? result,
    int? perPage,
    int? currentPage,
    bool? loading,
    ContractModel? contract
  }) {
    return CapNhatState(
      data: data ?? this.data,
      result: result ?? this.result,
      status: status ?? this.status,
      currentPage: currentPage ?? this.currentPage,
      perPage: perPage ?? this.perPage,
      errorMessage: errorMessage ?? this.errorMessage,
      loading: loading ?? this.loading,
      contract: contract ?? this.contract,
    );
  }
}
