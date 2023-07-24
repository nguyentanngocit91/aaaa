part of 'phieu_thu_provider.dart';
class PhieuThuState{

  PhieuThuState({this.formStatus = FormStatus.pure,this.soPhieuThu, this.maHopDong, this.tuNgay, this.denNgay, this.listPhieuThu});

  final FormStatus? formStatus;
  final String? soPhieuThu;
  final String? maHopDong;
  final String? tuNgay;
  final String? denNgay;
  final List<PhieuThuModel>? listPhieuThu;

  PhieuThuState copyWith({
    FormStatus? formStatus,
    String? soPhieuThu,
    String? maHopDong,
    String? tuNgay,
    String? denNgay,
    List<PhieuThuModel>? listPhieuThu,
  }) {
    return PhieuThuState(
      formStatus: formStatus ?? this.formStatus,
      soPhieuThu: soPhieuThu ?? this.soPhieuThu,
      maHopDong: maHopDong ?? this.maHopDong,
      tuNgay: tuNgay ?? this.tuNgay,
      denNgay: denNgay ?? this.denNgay,
      listPhieuThu: listPhieuThu ?? this.listPhieuThu,
    );
  }
}