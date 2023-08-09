
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_search_result_model.freezed.dart';
part 'item_search_result_model.g.dart';

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
class ItemSearchResultModel with _$ItemSearchResultModel {
  const factory ItemSearchResultModel({
    @JsonKey(name: 'lichsu_khoitao') L1_lichsu_khoitao? l1_lichsu_khoitao,
    @JsonKey(name: '_id') @required String? id,
    String? sohopdong,
    String? sohopdongcu,
    String? namhopdong,
    String? mahopdong,
    String? loaihopdong,
    String? ngaykyhd,
    @JsonKey(name: 'khachhangId') L1_khachhangId? l1_khachhangId,
    List<dynamic>? nhanvien,
    String? ghichu,
    @JsonKey(name: 'info') L1_info? l1_info,
    List<dynamic>? dichvuIds,
    String? tenhopdong,
    List<dynamic>? lichsu_capnhat,
    int? tongtien,
    List<dynamic>? files,
    String? tenhosting,
    int? dungluong,
    int? sonamdangky,
    String? ngaydangky,
    String? ngayhethan,
    String? tenapp,
    String? tenmien,
    List<dynamic>? danhsachtenmien,
    String? chucnang,
    String? mota,
    String? trangthai_hosting,
    List<dynamic>? lichsu_thanhtoan,
    String? ngaybangiao,
    String? ngaykichhoat,
    List<dynamic>? ngayupstore}) = _ItemSearchResultModel;

  factory ItemSearchResultModel.fromJson(Map<String, dynamic> json) => _$ItemSearchResultModelFromJson(json);
}

@freezed
class L1_lichsu_khoitao with _$L1_lichsu_khoitao {
  const factory L1_lichsu_khoitao({
    @JsonKey(name: 'parentId') L2_parentId? l2_parentId,
    @JsonKey(name: 'phongbanId') L2_phongbanId? l2_phongbanId,
    @JsonKey(name: '_id') @required String? id,
    String? manhanvien,
    String? hoten}) = _L1_lichsu_khoitao;

  factory L1_lichsu_khoitao.fromJson(Map<String, dynamic> json) => _$L1_lichsu_khoitaoFromJson(json);
}

@freezed
class L1_khachhangId with _$L1_khachhangId {
  const factory L1_khachhangId({
    @JsonKey(name: 'lichsu_khoitao') L2_lichsu_khoitao? l2_lichsu_khoitao,
    @JsonKey(name: '_id') @required String? id,
    String? makhachhang,
    String? type,
    String? hoten,
    String? phone,
    String? email,
    String? congty,
    String? masothue,
    String? diachi,
    String? cccd,
    @JsonKey(name: 'info') L2_info? l2_info,
    String? ghichu,
    List<dynamic>? lichsu_capnhat}) = _L1_khachhangId;

  factory L1_khachhangId.fromJson(Map<String, dynamic> json) => _$L1_khachhangIdFromJson(json);
}

@freezed
class L1_info with _$L1_info {
  const factory L1_info({
    List<dynamic>? danhsachtenmien}) = _L1_info;

  factory L1_info.fromJson(Map<String, dynamic> json) => _$L1_infoFromJson(json);
}

@freezed
class L2_parentId with _$L2_parentId {
  const factory L2_parentId({
    @JsonKey(name: '_id') @required String? id,
    String? manhanvien,
    String? hoten,
    String? manhanh}) = _L2_parentId;

  factory L2_parentId.fromJson(Map<String, dynamic> json) => _$L2_parentIdFromJson(json);
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

@freezed
class L2_lichsu_khoitao with _$L2_lichsu_khoitao {
  const factory L2_lichsu_khoitao({
    @JsonKey(name: 'parentId') L3_parentId? l3_parentId,
    @JsonKey(name: 'phongbanId') L3_phongbanId? l3_phongbanId,
    @JsonKey(name: '_id') @required String? id,
    String? manhanvien,
    String? hoten}) = _L2_lichsu_khoitao;

  factory L2_lichsu_khoitao.fromJson(Map<String, dynamic> json) => _$L2_lichsu_khoitaoFromJson(json);
}

@freezed
class L2_info with _$L2_info {
  const factory L2_info({
    String? fax,
    String? email_phu}) = _L2_info;

  factory L2_info.fromJson(Map<String, dynamic> json) => _$L2_infoFromJson(json);
}

@freezed
class L3_parentId with _$L3_parentId {
  const factory L3_parentId({
    @JsonKey(name: '_id') @required String? id,
    String? manhanvien,
    String? hoten,
    String? manhanh}) = _L3_parentId;

  factory L3_parentId.fromJson(Map<String, dynamic> json) => _$L3_parentIdFromJson(json);
}

@freezed
class L3_phongbanId with _$L3_phongbanId {
  const factory L3_phongbanId({
    @JsonKey(name: '_id') @required String? id,
    String? maphongban,
    String? manhanh,
    String? tenphongban}) = _L3_phongbanId;

  factory L3_phongbanId.fromJson(Map<String, dynamic> json) => _$L3_phongbanIdFromJson(json);
}

