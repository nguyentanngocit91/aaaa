import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'phieu_thu_model.freezed.dart';
part 'phieu_thu_model.g.dart';

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
class PhieuThuModel with _$PhieuThuModel {
  const factory PhieuThuModel({
    String? info,
    @JsonKey(name: '_id') @required String? id,
    String? maphieuthu,
    @JsonKey(name: 'khachhangId') L1_khachhangId? l1_khachhangId,
    List<dynamic>? nhanvien,
    List<dynamic>? hopdong,
    List<dynamic>? files,
    int? tongtien,
    int? phiweb,
    int? phinangcapweb,
    int? phihosting,
    int? phinangcaphosting,
    int? phitenmien,
    int? phiapp,
    int? phinangcapapp,
    int? vat,
    String? ngaytao,
    String? ngaynopcty,
    String? httt,
    String? ghichu,
    String? loaiphieuthu,
    bool? is_pending,
    List<dynamic>? lichsu_pending,}) = _PhieuThuModel;

  factory PhieuThuModel.fromJson(Map<String, dynamic> json) => _$PhieuThuModelFromJson(json);
}

@freezed
class L1_khachhangId with _$L1_khachhangId {
  const factory L1_khachhangId({
    @JsonKey(name: '_id') @required String? id,
    String? makhachhang}) = _L1_khachhangId;

  factory L1_khachhangId.fromJson(Map<String, dynamic> json) => _$L1_khachhangIdFromJson(json);
}

@freezed
class L1_lichsu_khoitao with _$L1_lichsu_khoitao {
  const factory L1_lichsu_khoitao({
    @JsonKey(name: '_id') @required String? id,
    String? parentId,
    String? manhanvien,
    String? hoten,
    String? phongbanId,
    String? ngaykhoitao}) = _L1_lichsu_khoitao;

  factory L1_lichsu_khoitao.fromJson(Map<String, dynamic> json) => _$L1_lichsu_khoitaoFromJson(json);
}

