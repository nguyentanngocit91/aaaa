// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phieu_thu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhieuThuModel _$$_PhieuThuModelFromJson(Map<String, dynamic> json) =>
    _$_PhieuThuModel(
      info: json['info'] as String?,
      id: json['_id'] as String?,
      maphieuthu: json['maphieuthu'] as String?,
      l1_khachhangId: json['khachhangId'] == null
          ? null
          : L1_khachhangId.fromJson(
              json['khachhangId'] as Map<String, dynamic>),
      nhanvien: json['nhanvien'] as List<dynamic>?,
      hopdong: json['hopdong'] as List<dynamic>?,
      files: json['files'] as List<dynamic>?,
      tongtien: json['tongtien'] as int?,
      phiweb: json['phiweb'] as int?,
      phinangcapweb: json['phinangcapweb'] as int?,
      phihosting: json['phihosting'] as int?,
      phinangcaphosting: json['phinangcaphosting'] as int?,
      phitenmien: json['phitenmien'] as int?,
      phiapp: json['phiapp'] as int?,
      phinangcapapp: json['phinangcapapp'] as int?,
      vat: json['vat'] as int?,
      ngaytao: json['ngaytao'] as String?,
      ngaynopcty: json['ngaynopcty'] as String?,
      httt: json['httt'] as String?,
      ghichu: json['ghichu'] as String?,
      loaiphieuthu: json['loaiphieuthu'] as String?,
      is_pending: json['is_pending'] as bool?,
    );

Map<String, dynamic> _$$_PhieuThuModelToJson(_$_PhieuThuModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      '_id': instance.id,
      'maphieuthu': instance.maphieuthu,
      'khachhangId': instance.l1_khachhangId,
      'nhanvien': instance.nhanvien,
      'hopdong': instance.hopdong,
      'files': instance.files,
      'tongtien': instance.tongtien,
      'phiweb': instance.phiweb,
      'phinangcapweb': instance.phinangcapweb,
      'phihosting': instance.phihosting,
      'phinangcaphosting': instance.phinangcaphosting,
      'phitenmien': instance.phitenmien,
      'phiapp': instance.phiapp,
      'phinangcapapp': instance.phinangcapapp,
      'vat': instance.vat,
      'ngaytao': instance.ngaytao,
      'ngaynopcty': instance.ngaynopcty,
      'httt': instance.httt,
      'ghichu': instance.ghichu,
      'loaiphieuthu': instance.loaiphieuthu,
      'is_pending': instance.is_pending,
    };

_$_L1_khachhangId _$$_L1_khachhangIdFromJson(Map<String, dynamic> json) =>
    _$_L1_khachhangId(
      id: json['_id'] as String?,
      makhachhang: json['makhachhang'] as String?,
    );

Map<String, dynamic> _$$_L1_khachhangIdToJson(_$_L1_khachhangId instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'makhachhang': instance.makhachhang,
    };
