
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'searchcustomer_model.freezed.dart';
part 'searchcustomer_model.g.dart';

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
class SearchCustomerModel with _$SearchCustomerModel {
	const factory SearchCustomerModel({
		String? ghichu,
		List<dynamic>? lichsu_khoitao,
		List<dynamic>? lichsu_capnhat,
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
		@JsonKey(name: 'info') L1_info? l1_info}) = _SearchCustomerModel;

	factory SearchCustomerModel.fromJson(Map<String, dynamic> json) => _$SearchCustomerModelFromJson(json);
}

@freezed
class L1_info with _$L1_info {
	const factory L1_info({
		String? fax}) = _L1_info;

	factory L1_info.fromJson(Map<String, dynamic> json) => _$L1_infoFromJson(json);
}

