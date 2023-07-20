
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

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
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'actived') L1_actived? l1_actived,
    @JsonKey(name: 'locked') L1_locked? l1_locked,
    @JsonKey(name: 'permission') L1_permission? l1_permission,
    @JsonKey(name: 'trashed') L1_trashed? l1_trashed,
    @JsonKey(name: '_id') @required String? id,
    String? manhanvien,
    String? username,
    String? password,
    String? token,
    String? role,
    String? createdAt,
    String? updatedAt,
    @JsonKey(name: '__v') int? dataversion}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
class L1_actived with _$L1_actived {
  const factory L1_actived({
    int? check,
    String? message}) = _L1_actived;

  factory L1_actived.fromJson(Map<String, dynamic> json) => _$L1_activedFromJson(json);
}

@freezed
class L1_locked with _$L1_locked {
  const factory L1_locked({
    int? check,
    String? message}) = _L1_locked;

  factory L1_locked.fromJson(Map<String, dynamic> json) => _$L1_lockedFromJson(json);
}

@freezed
class L1_permission with _$L1_permission {
  const factory L1_permission({
    int? check,
    String? message}) = _L1_permission;

  factory L1_permission.fromJson(Map<String, dynamic> json) => _$L1_permissionFromJson(json);
}

@freezed
class L1_trashed with _$L1_trashed {
  const factory L1_trashed({
    int? check,
    String? message}) = _L1_trashed;

  factory L1_trashed.fromJson(Map<String, dynamic> json) => _$L1_trashedFromJson(json);
}

