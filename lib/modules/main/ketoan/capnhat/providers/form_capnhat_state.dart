part of 'form_capnhat_provider.dart';

class CapNhatState {
  final Map<String, String>? data;
  final FormStatus status;
  final String? message;
  final Map<String, dynamic>? result;
  final loadingStatus loading;
  final bool success;
  final List? uploadList;

  const CapNhatState({
    this.data = null,
    this.status = FormStatus.pure,
    this.message = '',
    this.result = null,
    this.loading = loadingStatus.NONE,
    this.success = false,
    this.uploadList = null,
  });

  CapNhatState copyWith({
    Map<String, String>? data,
    FormStatus? status,
    String? message,
    Map<String, dynamic>? result,
    loadingStatus? loading,
    bool? success,
    List? uploadList,
  }) {
    return CapNhatState(
        data: data ?? this.data,
        result: result ?? this.result,
        status: status ?? this.status,
        message: message ?? this.message,
        loading: loading ?? this.loading,
        success: success ?? this.success,
        uploadList: uploadList ?? this.uploadList);
  }
}
