part of 'form_khach_hang_moi_provider.dart';

class FormKhachHangMoiState {
  final FormStatus? formStatus;
  final Map? data;
  final bool isHopDongWebsite;
  final bool isHopDongDomain;
  final bool isHopDongHosting;
  final bool isHopDongApp;

  FormKhachHangMoiState({
    this.formStatus = FormStatus.pure,
    this.data,
    this.isHopDongWebsite = true,
    this.isHopDongApp = false,
    this.isHopDongDomain = false,
    this.isHopDongHosting = false,
  });

  copyWith(
      {FormStatus? formStatus,
      Map? data,
      bool? isHopDongWebsite,
      bool? isHopDongApp,
      bool? isHopDongDomain,
      bool? isHopDongHosting}) {
    return FormKhachHangMoiState(
      formStatus: formStatus ?? this.formStatus,
      data: data ?? this.data,
      isHopDongApp: isHopDongApp ?? this.isHopDongApp,
      isHopDongWebsite: isHopDongWebsite ?? this.isHopDongWebsite,
      isHopDongDomain: isHopDongDomain ?? this.isHopDongDomain,
      isHopDongHosting: isHopDongHosting ?? this.isHopDongHosting,
    );
  }
}
