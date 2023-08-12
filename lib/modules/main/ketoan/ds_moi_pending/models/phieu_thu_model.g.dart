// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phieu_thu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhieuThuModel _$$_PhieuThuModelFromJson(Map<String, dynamic> json) =>
    _$_PhieuThuModel(
      id: json['_id'] as String?,
      maphieuthu: json['maphieuthu'] as String?,
      l1_khachhangId: json['khachhangId'] == null
          ? null
          : L1_khachhangId.fromJson(
              json['khachhangId'] as Map<String, dynamic>),
      nhanvien: json['nhanvien'] as List<dynamic>?,
      hopdong: json['hopdong'] as List<dynamic>?,
      files: json['files'] as List<dynamic>?,
      tongtien: (json['tongtien'] as num?)?.toDouble(),
      phiweb: (json['phiweb'] as num?)?.toDouble(),
      phinangcapweb: (json['phinangcapweb'] as num?)?.toDouble(),
      phihosting: (json['phihosting'] as num?)?.toDouble(),
      phinangcaphosting: (json['phinangcaphosting'] as num?)?.toDouble(),
      phitenmien: (json['phitenmien'] as num?)?.toDouble(),
      phiapp: (json['phiapp'] as num?)?.toDouble(),
      phinangcapapp: (json['phinangcapapp'] as num?)?.toDouble(),
      vat: (json['vat'] as num?)?.toDouble(),
      ngaytao: json['ngaytao'] as String?,
      ngaynopcty: json['ngaynopcty'] as String?,
      httt: json['httt'] as String?,
      ghichu: json['ghichu'] as String?,
      loaiphieuthu: json['loaiphieuthu'] as String?,
      is_pending: json['is_pending'] as bool?,
      lichsu_pending: json['lichsu_pending'] as List<dynamic>?,
      info: json['info'] as Map<String, dynamic>?,
      lichsu_capnhat: json['lichsu_capnhat'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_PhieuThuModelToJson(_$_PhieuThuModel instance) =>
    <String, dynamic>{
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
      'lichsu_pending': instance.lichsu_pending,
      'info': instance.info,
      'lichsu_capnhat': instance.lichsu_capnhat,
    };

_$_L1_khachhangId _$$_L1_khachhangIdFromJson(Map<String, dynamic> json) =>
    _$_L1_khachhangId(
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
      info: json['info'] as Map<String, dynamic>?,
      ghichu: json['ghichu'] as String?,
    );

Map<String, dynamic> _$$_L1_khachhangIdToJson(_$_L1_khachhangId instance) =>
    <String, dynamic>{
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
      'info': instance.info,
      'ghichu': instance.ghichu,
    };
