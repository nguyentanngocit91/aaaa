// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchcustomer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchCustomerModel _$$_SearchCustomerModelFromJson(
        Map<String, dynamic> json) =>
    _$_SearchCustomerModel(
      ghichu: json['ghichu'] as String?,
      lichsu_khoitao: json['lichsu_khoitao'] as List<dynamic>?,
      lichsu_capnhat: json['lichsu_capnhat'] as List<dynamic>?,
      id: json['_id'] as String?,
      makhachhang: json['makhachhang'] as String?,
      type: json['type'] as String?,
      hoten: json['hoten'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      congty: json['congty'] as String?,
      masothue: json['masothue'] as String?,
      diachi: json['diachi'] as String?,
      cccd: json['cccd'] as String?,
      l1_info: json['info'] == null
          ? null
          : L1_info.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SearchCustomerModelToJson(
        _$_SearchCustomerModel instance) =>
    <String, dynamic>{
      'ghichu': instance.ghichu,
      'lichsu_khoitao': instance.lichsu_khoitao,
      'lichsu_capnhat': instance.lichsu_capnhat,
      '_id': instance.id,
      'makhachhang': instance.makhachhang,
      'type': instance.type,
      'hoten': instance.hoten,
      'phone': instance.phone,
      'email': instance.email,
      'congty': instance.congty,
      'masothue': instance.masothue,
      'diachi': instance.diachi,
      'cccd': instance.cccd,
      'info': instance.l1_info,
    };

_$_L1_info _$$_L1_infoFromJson(Map<String, dynamic> json) => _$_L1_info(
      fax: json['fax'] as String?,
    );

Map<String, dynamic> _$$_L1_infoToJson(_$_L1_info instance) =>
    <String, dynamic>{
      'fax': instance.fax,
    };
