
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_model.freezed.dart';
part 'file_model.g.dart';

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
class FileModel with _$FileModel {
  const factory FileModel({
    @JsonKey(name: 'lichsu_khoitao') L1_lichsu_khoitao? l1_lichsu_khoitao,
    @JsonKey(name: '_id') @required String? id,
    String? folderId,
    String? sohopdong,
    String? khachhangId,
    String? loaifile,
    String? loaimedia,
    String? ghichu,
    String? originalname,
    String? filename,
    String? path,
    String? destination,
    int? size,
    String? folder,
    String? mimetype,
    String? ext,
    DateTime? createdAt,
    DateTime? updatedAt}) = _FileModel;

  factory FileModel.fromJson(Map<String, dynamic> json) => _$FileModelFromJson(json);
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
class L2_parentId with _$L2_parentId {
  const factory L2_parentId({
    @JsonKey(name: '_id') @required String? id,
    String? manhanvien,
    String? hoten}) = _L2_parentId;

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

