part of 'form_them_phieuthu_provider.dart';


class FormThemPhieuThuState {
  final Map<String, String>? data;
  final String? soHopDong;
  final Map? dataPhieuThu;
  final FormStatus status;
  final String? message;
  final Map<String, dynamic>? result;
  final loadingStatus loading;
  final bool success;
  final List? uploadList;

  const FormThemPhieuThuState({
    this.data = null,
    this.soHopDong,
    this.dataPhieuThu,
    this.status = FormStatus.pure,
    this.message = '',
    this.result = null,
    this.loading = loadingStatus.NONE,
    this.success = false,
    this.uploadList = null,
  });

  FormThemPhieuThuState copyWith({
    Map<String, String>? data,
    String? soHopDong,
    Map? dataPhieuThu,
    FormStatus? status,
    String? message,
    Map<String, dynamic>? result,
    loadingStatus? loading,
    bool? success,
    List? uploadList,
  }) {
    return FormThemPhieuThuState(
        data: data ?? this.data,
        soHopDong: soHopDong ?? this.soHopDong,
        dataPhieuThu: dataPhieuThu ?? this.dataPhieuThu,
        result: result ?? this.result,
        status: status ?? this.status,
        message: message ?? this.message,
        loading: loading ?? this.loading,
        success: success ?? this.success,
        uploadList: uploadList ?? this.uploadList);
  }
}