part of 'capnhat_provider.dart';
class CapNhatState{
  final Map<String,String>? data;
  final FormStatus status;
  final String? errorMessage;

  const CapNhatState({
    this.data = null,
    this.status = FormStatus.pure,
    this.errorMessage = '',
  });

  CapNhatState copyWith({

    Map<String,String>? data,
    FormStatus? status,
    String? errorMessage,
  }) {
    return CapNhatState(
      data: data ?? this.data,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
