
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hopdong_model.freezed.dart';
part 'hopdong_model.g.dart';

// **************************************************************************
// Đây là nội dung được tạo tự động bằng NextDEV Tool
// Đề nghị không chỉnh sửa nội dung file này
// Hãy đảm bảo các gói này được thêm vào file pubspec.yaml
// dependencies:
// 	freezed_annotation: <lastest_version>
// 	json_annotation: <lastest_version>
// dev_dependencies:
// 	build_runner: <lastest_version>
// 	freezed: <lastest_version>
// 	json_serializable: <lastest_version>
// Bằng câu lệnh :
// 	flutter pub add freezed_annotation json_annotation
// 	flutter pub add build_runner freezed json_serializable --dev
// Chạy câu lệnh sau để build file freezed:
// 	flutter pub run build_runner build
// Version : 1.0.1 Beta
// **************************************************************************

@freezed
class HopDongModel with _$HopDongModel {
  const factory HopDongModel({
    String? sohopdongcu,
    List<dynamic>? dichvuIds,
    List<dynamic>? files,
    String? ngayhethan,
    String? tenapp,
    String? tenmien,
    List<dynamic>? danhsachtenmien,
    String? chucnang,
    String? mota,
    int? dungluong,
    int? sonamdangky,
    String? ngaydangky,
    String? ngaybangiao,
    List<dynamic>? ngayupstore,
    String? ngaykichhoat,
    String? trangthai_hosting,
    List<dynamic>? lichsu_thanhtoan,
    @JsonKey(name: '_id') @required String? id,
    String? sohopdong,
    String? namhopdong,
    String? ngaykyhd,
    String? loaihopdong,
    String? mahopdongcu,
    String? mahopdong,
    List<dynamic>? nhanvien,
    String? ghichu,
    @JsonKey(name: 'info') L1_info? l1_info,
    @JsonKey(name: 'khachhangId') L1_khachhangId? l1_khachhangId,
    String? tenhopdong,
    int? tongtien,
    List<dynamic>? lichsu_capnhat}) = _HopDongModel;

  factory HopDongModel.fromJson(Map<String, dynamic> json) => _$HopDongModelFromJson(json);
}

@freezed
class L1_info with _$L1_info {
  const factory L1_info({
    String? chucnang}) = _L1_info;

  factory L1_info.fromJson(Map<String, dynamic> json) => _$L1_infoFromJson(json);
}

@freezed
class L1_khachhangId with _$L1_khachhangId {
  const factory L1_khachhangId({
    String? ghichu,
    @JsonKey(name: '_id') @required String? id,
    String? makhachhang,
    String? type,
    String? hoten,
    String? phone,
    String? email,
    String? congty,
    String? masothue,
    String? diachi,
    String? cccd}) = _L1_khachhangId;

  factory L1_khachhangId.fromJson(Map<String, dynamic> json) => _$L1_khachhangIdFromJson(json);
}

@freezed
class L2_phongbanId with _$L2_phongbanId {
  const factory L2_phongbanId({
    @JsonKey(name: '_id') @required String? id,
    String? maphongban,
    String? manhanh,
    String? tenphongban}) = _L2_phongbanId;

  factory L2_phongbanId.fromJson(Map<String, dynamic> json) => _$L2_phongbanIdFromJson(json);
}