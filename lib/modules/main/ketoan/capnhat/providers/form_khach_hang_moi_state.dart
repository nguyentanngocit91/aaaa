
part of 'form_khach_hang_moi_provider.dart';

class FormKhachHangMoiState {
  final FormStatus? formStatus;
  final String? soHopDong;
  final String? maKhachHang;
  final Map? dataKhachHang;
  final Map? dataHopDong;
  final Map? dataPhieuThu;
  final Map? dataWebsite;
  final Map? dataDomain;
  final Map? dataHosting;
  final Map? dataApp;
  final bool isHopDongWebsite;
  final bool isHopDongDomain;
  final bool isHopDongHosting;
  final bool isHopDongApp;
  final Map? response;
  final loadingStatus loading;


  FormKhachHangMoiState({
    this.formStatus = FormStatus.pure,
    this.soHopDong,
    this.maKhachHang,
    this.dataKhachHang,
    this.dataHopDong,
    this.dataPhieuThu,
    this.dataWebsite,
    this.dataDomain,
    this.dataHosting,
    this.dataApp,
    this.isHopDongWebsite = true,
    this.isHopDongApp = false,
    this.isHopDongDomain = false,
    this.isHopDongHosting = false,
    this.response,
    this.loading = loadingStatus.NONE,
  });

  copyWith(
      {FormStatus? formStatus,
        String? soHopDong,
        String? maKhachHang,
        Map? dataKhachHang,
        Map? dataHopDong,
        Map? dataPhieuThu,
        Map? dataWebsite,
        Map? dataDomain,
        Map? dataHosting,
        Map? dataApp,
        bool? isHopDongWebsite,
        bool? isHopDongApp,
        bool? isHopDongDomain,
        bool? isHopDongHosting,
        Map? response,
        loadingStatus? loading

      }) {
    return FormKhachHangMoiState(
      formStatus: formStatus ?? this.formStatus,
      soHopDong: soHopDong ?? this.soHopDong,
      maKhachHang: maKhachHang ?? this.maKhachHang,
      dataKhachHang: dataKhachHang ?? this.dataKhachHang,
      dataHopDong: dataHopDong ?? this.dataHopDong,
      dataPhieuThu: dataPhieuThu ?? this.dataPhieuThu,
      dataWebsite: dataWebsite ?? this.dataWebsite,
      dataDomain: dataDomain ?? this.dataDomain,
      dataHosting: dataHosting ?? this.dataHosting,
      dataApp: dataApp ?? this.dataApp,
      isHopDongApp: isHopDongApp ?? this.isHopDongApp,
      isHopDongWebsite: isHopDongWebsite ?? this.isHopDongWebsite,
      isHopDongDomain: isHopDongDomain ?? this.isHopDongDomain,
      isHopDongHosting: isHopDongHosting ?? this.isHopDongHosting,
      response: response ?? this.response,
        loading: loading ?? this.loading

    );
  }
}
