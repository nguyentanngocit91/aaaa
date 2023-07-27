part of 'phieu_thu_provider.dart';
class PhieuThuState{

  PhieuThuState({this.status = FormStatus.pure,this.soPhieuThu, this.maHopDong, this.tuNgay, this.denNgay, this.listPhieuThu = const []});

  final FormStatus? status;
  final String? soPhieuThu;
  final String? maHopDong;
  final String? tuNgay;
  final String? denNgay;
  final List<PhieuThuModel> listPhieuThu;

  PhieuThuState copyWith({
    FormStatus? status,
    String? soPhieuThu,
    String? maHopDong,
    String? tuNgay,
    String? denNgay,
    List<PhieuThuModel>? listPhieuThu,
  }) {
    return PhieuThuState(
      status: status ?? this.status,
      soPhieuThu: soPhieuThu ?? this.soPhieuThu,
      maHopDong: maHopDong ?? this.maHopDong,
      tuNgay: tuNgay ?? this.tuNgay,
      denNgay: denNgay ?? this.denNgay,
      listPhieuThu: listPhieuThu ?? this.listPhieuThu,
    );
  }
}