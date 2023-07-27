


part of 'danh_sach_blacklist_provider.dart';


class DanhSachBlacklistState{

  DanhSachBlacklistState({this.formStatus = FormStatus.pure,this.soPhieuThu, this.maHopDong, this.tuNgay, this.denNgay, this.listBlacklist});

  final FormStatus? formStatus;
  final String? soPhieuThu;
  final String? maHopDong;
  final String? tuNgay;
  final String? denNgay;
  final List<DanhSachBlacklistModel>? listBlacklist;

  DanhSachBlacklistState copyWith({
    FormStatus? formStatus,
    String? soPhieuThu,
    String? maHopDong,
    String? tuNgay,
    String? denNgay,
    List<DanhSachBlacklistModel>? listBlacklist,
  }) {
    return DanhSachBlacklistState(
      formStatus: formStatus ?? this.formStatus,
      soPhieuThu: soPhieuThu ?? this.soPhieuThu,
      maHopDong: maHopDong ?? this.maHopDong,
      tuNgay: tuNgay ?? this.tuNgay,
      denNgay: denNgay ?? this.denNgay,
      listBlacklist: listBlacklist ?? this.listBlacklist,
    );
  }
}