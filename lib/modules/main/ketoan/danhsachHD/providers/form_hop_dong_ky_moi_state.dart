part of 'form_hop_dong_ky_moi_provider.dart';

class FormHopDongKyMoiState {
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
  final CustomerUpdateModel? customer;
  final bool isLoading;

  FormHopDongKyMoiState({
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
    this.customer,
    this.isLoading = true,
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
      bool? isHopDongHosting, CustomerUpdateModel? customer,
        bool? isLoading}) {
    return FormHopDongKyMoiState(
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
      customer: customer ?? this.customer,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
