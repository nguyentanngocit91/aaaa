
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
		@JsonKey(name: '_id') @required String? id,
		String? makhachhang,
		String? hoten,
		String? congty,
		String? masothue,
		String? cccd,
		String? phone,
		String? email,
		String? diachi,
		@JsonKey(name: 'info') L1_info? l1_info,
		String? ghichu,
		@JsonKey(name: 'lichsu_khoitao') L1_lichsu_khoitao? l1_lichsu_khoitao,
		List<dynamic>? lichsu_capnhat,
		String? type}) = _SearchCustomerModel;

	factory SearchCustomerModel.fromJson(Map<String, dynamic> json) => _$SearchCustomerModelFromJson(json);
}

@freezed
class L1_info with _$L1_info {
	const factory L1_info({
		String? email_phu,
		String? nguoidaidienmoi,
		String? dienthoaicoquan,
		String? fax}) = _L1_info;

	factory L1_info.fromJson(Map<String, dynamic> json) => _$L1_infoFromJson(json);
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

