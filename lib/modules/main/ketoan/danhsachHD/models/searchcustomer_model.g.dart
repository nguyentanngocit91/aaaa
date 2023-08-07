// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchcustomer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchCustomerModel _$$_SearchCustomerModelFromJson(
        Map<String, dynamic> json) =>
    _$_SearchCustomerModel(
      lichsu_khoitao: json['lichsu_khoitao'] as List<dynamic>?,
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
      ghichu: json['ghichu'] as String?,
      lichsu_capnhat: json['lichsu_capnhat'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_SearchCustomerModelToJson(
        _$_SearchCustomerModel instance) =>
    <String, dynamic>{
      'lichsu_khoitao': instance.lichsu_khoitao,
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
      'ghichu': instance.ghichu,
      'lichsu_capnhat': instance.lichsu_capnhat,
    };

_$_L1_info _$$_L1_infoFromJson(Map<String, dynamic> json) => _$_L1_info(
      email_phu: json['email_phu'] as String?,
      nguoidaidienmoi: json['nguoidaidienmoi'] as String?,
      dienthoaicoquan: json['dienthoaicoquan'] as String?,
    );

Map<String, dynamic> _$$_L1_infoToJson(_$_L1_info instance) =>
    <String, dynamic>{
      'email_phu': instance.email_phu,
      'nguoidaidienmoi': instance.nguoidaidienmoi,
      'dienthoaicoquan': instance.dienthoaicoquan,
    };
