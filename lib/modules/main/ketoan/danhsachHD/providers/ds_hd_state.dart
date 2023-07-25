part of 'ds_hd_provider.dart';



class DSHDState{
  final Map<String,String>? data;
  final FormStatus status;
  final String? errorMessage;
  final Map<String,dynamic>? result;

  const DSHDState({
    this.data = null,
    this.status = FormStatus.pure,
    this.errorMessage = '',
    this.result = null,
  });

  DSHDState copyWith({

    Map<String,String>? data,
    FormStatus? status,
    String? errorMessage,
    Map<String,dynamic>? result,
  }) {
    return DSHDState(
      data: data ?? this.data,
      result: result ?? this.result,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
