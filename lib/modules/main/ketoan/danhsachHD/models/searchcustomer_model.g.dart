// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchcustomer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchCustomerModel _$$_SearchCustomerModelFromJson(
        Map<String, dynamic> json) =>
    _$_SearchCustomerModel(
      id: json['_id'] as String?,
      makhachhang: json['makhachhang'] as String?,
      hoten: json['hoten'] as String?,
      congty: json['congty'] as String?,
      masothue: json['masothue'] as String?,
      cccd: json['cccd'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      diachi: json['diachi'] as String?,
      l1_info: json['info'] == null
          ? null
          : L1_info.fromJson(json['info'] as Map<String, dynamic>),
      ghichu: json['ghichu'] as String?,
      l1_lichsu_khoitao: json['lichsu_khoitao'] == null
          ? null
          : L1_lichsu_khoitao.fromJson(
              json['lichsu_khoitao'] as Map<String, dynamic>),
      lichsu_capnhat: json['lichsu_capnhat'] as List<dynamic>?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$_SearchCustomerModelToJson(
        _$_SearchCustomerModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'makhachhang': instance.makhachhang,
      'hoten': instance.hoten,
      'congty': instance.congty,
      'masothue': instance.masothue,
      'cccd': instance.cccd,
      'phone': instance.phone,
      'email': instance.email,
      'diachi': instance.diachi,
      'info': instance.l1_info,
      'ghichu': instance.ghichu,
      'lichsu_khoitao': instance.l1_lichsu_khoitao,
      'lichsu_capnhat': instance.lichsu_capnhat,
      'type': instance.type,
    };

_$_L1_info _$$_L1_infoFromJson(Map<String, dynamic> json) => _$_L1_info(
      email_phu: json['email_phu'] as String?,
      nguoidaidienmoi: json['nguoidaidienmoi'] as String?,
      dienthoaicoquan: json['dienthoaicoquan'] as String?,
      fax: json['fax'] as String?,
    );

Map<String, dynamic> _$$_L1_infoToJson(_$_L1_info instance) =>
    <String, dynamic>{
      'email_phu': instance.email_phu,
      'nguoidaidienmoi': instance.nguoidaidienmoi,
      'dienthoaicoquan': instance.dienthoaicoquan,
      'fax': instance.fax,
    };

_$_L1_lichsu_khoitao _$$_L1_lichsu_khoitaoFromJson(Map<String, dynamic> json) =>
    _$_L1_lichsu_khoitao(
      id: json['_id'] as String?,
      parentId: json['parentId'] as String?,
      manhanvien: json['manhanvien'] as String?,
      hoten: json['hoten'] as String?,
      phongbanId: json['phongbanId'] as String?,
      ngaykhoitao: json['ngaykhoitao'] as String?,
    );

Map<String, dynamic> _$$_L1_lichsu_khoitaoToJson(
        _$_L1_lichsu_khoitao instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'parentId': instance.parentId,
      'manhanvien': instance.manhanvien,
      'hoten': instance.hoten,
      'phongbanId': instance.phongbanId,
      'ngaykhoitao': instance.ngaykhoitao,
    };
