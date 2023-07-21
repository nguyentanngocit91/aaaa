part of 'capnhat_provider.dart';
class CapNhatState{
  final Map<String,String>? data;
  final FormStatus status;
  final String? errorMessage;
  final Map<String,dynamic>? result;

  const CapNhatState({
    this.data = null,
    this.status = FormStatus.pure,
    this.errorMessage = '',
    this.result = null,
  });

  CapNhatState copyWith({

    Map<String,String>? data,
    FormStatus? status,
    String? errorMessage,
    Map<String,dynamic>? result,
  }) {
    return CapNhatState(
      data: data ?? this.data,
      result: result ?? this.result,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
