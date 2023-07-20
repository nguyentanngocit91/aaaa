import '../../../../../_shared/utils/form_status.dart';

class DoiMatKhauState{
  final String? matKhauCu;
  final String? matKhauMoi;
  final FormStatus? formStatus;
  final String? message;

  DoiMatKhauState({this.matKhauCu, this.matKhauMoi, this.formStatus, this.message});

  copyWith({String? matKhauCu, String? matKhauMoi, String? reMatKhauMoi, FormStatus? formStatus, String? message}){
    return DoiMatKhauState(
      matKhauCu: matKhauCu ?? this.matKhauCu,
      matKhauMoi: matKhauMoi ?? this.matKhauMoi,
      formStatus: formStatus ?? this.formStatus,
      message: message ?? this.message
    );
  }
}