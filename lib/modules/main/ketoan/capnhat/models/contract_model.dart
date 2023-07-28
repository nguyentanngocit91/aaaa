
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_model.freezed.dart';
part 'contract_model.g.dart';

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
class ContractModel with _$ContractModel {
  const factory ContractModel({
    @JsonKey(name: 'data') L1_data? l1_data,
    List<dynamic>? apps,
    List<dynamic>? webs,
    List<dynamic>? hostings,
    List<dynamic>? domains}) = _ContractModel;

  factory ContractModel.fromJson(Map<String, dynamic> json) => _$ContractModelFromJson(json);
}

@freezed
class L1_data with _$L1_data {
  const factory L1_data({
    List<dynamic>? dichvuIds,
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
    @JsonKey(name: 'info') L2_info? l2_info,
    String? khachhangId,
    String? tenhopdong,
    @JsonKey(name: 'lichsu_khoitao') L2_lichsu_khoitao? l2_lichsu_khoitao,
    int? tongtien,
    List<dynamic>? lichsu_capnhat}) = _L1_data;

  factory L1_data.fromJson(Map<String, dynamic> json) => _$L1_dataFromJson(json);
}

@freezed
class L2_info with _$L2_info {
  const factory L2_info({
    String? chucnang}) = _L2_info;

  factory L2_info.fromJson(Map<String, dynamic> json) => _$L2_infoFromJson(json);
}

@freezed
class L2_lichsu_khoitao with _$L2_lichsu_khoitao {
  const factory L2_lichsu_khoitao({
    @JsonKey(name: '_id') @required String? id,
    String? parentId,
    String? manhanvien,
    String? hoten,
    @JsonKey(name: 'phongbanId') L3_phongbanId? l3_phongbanId}) = _L2_lichsu_khoitao;

  factory L2_lichsu_khoitao.fromJson(Map<String, dynamic> json) => _$L2_lichsu_khoitaoFromJson(json);
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

