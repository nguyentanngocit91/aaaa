


part of 'danh_sach_blacklist_provider.dart';
enum ActionBlacklist{initBlacklist,addBlacklist,delBlacklist,updateBlacklist}

class DanhSachBlacklistState{

  DanhSachBlacklistState({this.formStatus = FormStatus.pure, this.maHopDong, this.action=ActionBlacklist.initBlacklist, this.ghiChu,this.messs, this.listBlacklist});

  final FormStatus? formStatus;
  final String? maHopDong;
  final String? ghiChu;
  final String? messs;
  final ActionBlacklist action;
  final List<DanhSachBlacklistModel>? listBlacklist;

  DanhSachBlacklistState copyWith({
    FormStatus? formStatus,
    String? maHopDong,
    String? messs,
    String? ghiChu,
    ActionBlacklist? action,

    List<DanhSachBlacklistModel>? listBlacklist,
  }) {
    return DanhSachBlacklistState(
      formStatus: formStatus ?? this.formStatus,
      maHopDong: maHopDong ?? this.maHopDong,
      ghiChu: ghiChu ?? this.ghiChu,
      action: action ?? this.action,
      messs: messs ?? this.messs,
      listBlacklist: listBlacklist ?? this.listBlacklist,
    );
  }
}