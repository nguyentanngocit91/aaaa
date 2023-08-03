part of 'ds_hd_provider.dart';



class DSHDState{
  final Map<String,String>? data;
  final String? tenHD;
  final String? tongTien;
  final FormStatus status;
  final String? errorMessage;
  final Map<String,dynamic>? result;
  final int perPage;
  final int currentPage;
  final bool loading;
  final List<ItemPhieuthuResultModel> listPhieuThu;

  const DSHDState({
    this.data = null,
    this.status = FormStatus.pure,
    this.tenHD='',
    this.tongTien='',
    this.errorMessage = '',
    this.result = null,
    this.perPage = 10,
    this.currentPage = 1,
    this.loading = false,
    this.listPhieuThu = const [],
  });

  DSHDState copyWith({

    Map<String,String>? data,
    FormStatus? status,
    String? tenHD,
    String? tongTien,
    String? errorMessage,
    Map<String,dynamic>? result,
    int? perPage,
    int? currentPage,
    bool? loading,
    List<ItemPhieuthuResultModel>? listPhieuThu,
  }) {
    return DSHDState(
      data: data ?? this.data,
      result: result ?? this.result,
      status: status ?? this.status,
      tenHD: tenHD ?? this.tenHD,
      tongTien: tongTien ?? this.tongTien,
      currentPage: currentPage ?? this.currentPage,
      perPage: perPage ?? this.perPage,
      errorMessage: errorMessage ?? this.errorMessage,
      loading: loading ?? this.loading,
      listPhieuThu: listPhieuThu ?? this.listPhieuThu,
    );
  }
}
