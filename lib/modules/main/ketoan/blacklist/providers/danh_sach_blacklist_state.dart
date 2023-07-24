


part of 'danh_sach_blacklist_provider.dart';

class DanhSachBlacklistState{
  final FormStatus? formStatus;
  final Map? data;

  DanhSachBlacklistState({this.formStatus, this.data});

  DanhSachBlacklistState copyWith({
    FormStatus? formStatus,
    Map? data,
  }) {
    return DanhSachBlacklistState(
      formStatus: formStatus ?? this.formStatus,
      data: data ?? this.data,
    );
  }
}