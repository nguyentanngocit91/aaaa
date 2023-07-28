// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchcustomercontract_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchCustomerContractModel _$$_SearchCustomerContractModelFromJson(
        Map<String, dynamic> json) =>
    _$_SearchCustomerContractModel(
      dichvuIds: json['dichvuIds'] as List<dynamic>?,
      lichsu_thanhtoan: json['lichsu_thanhtoan'] as List<dynamic>?,
      id: json['_id'] as String?,
      sohopdong: json['sohopdong'] as String?,
      namhopdong: json['namhopdong'] as String?,
      ngaykyhd: json['ngaykyhd'] as String?,
      loaihopdong: json['loaihopdong'] as String?,
      mahopdongcu: json['mahopdongcu'] as String?,
      mahopdong: json['mahopdong'] as String?,
      nhanvien: json['nhanvien'] as List<dynamic>?,
      ghichu: json['ghichu'] as String?,
      l1_info: json['info'] == null
          ? null
          : L1_info.fromJson(json['info'] as Map<String, dynamic>),
      khachhangId: json['khachhangId'] as String?,
      tenhopdong: json['tenhopdong'] as String?,
      l1_lichsu_khoitao: json['lichsu_khoitao'] == null
          ? null
          : L1_lichsu_khoitao.fromJson(
              json['lichsu_khoitao'] as Map<String, dynamic>),
      tongtien: json['tongtien'] as int?,
      lichsu_capnhat: json['lichsu_capnhat'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_SearchCustomerContractModelToJson(
        _$_SearchCustomerContractModel instance) =>
    <String, dynamic>{
      'dichvuIds': instance.dichvuIds,
      'lichsu_thanhtoan': instance.lichsu_thanhtoan,
      '_id': instance.id,
      'sohopdong': instance.sohopdong,
      'namhopdong': instance.namhopdong,
      'ngaykyhd': instance.ngaykyhd,
      'loaihopdong': instance.loaihopdong,
      'mahopdongcu': instance.mahopdongcu,
      'mahopdong': instance.mahopdong,
      'nhanvien': instance.nhanvien,
      'ghichu': instance.ghichu,
      'info': instance.l1_info,
      'khachhangId': instance.khachhangId,
      'tenhopdong': instance.tenhopdong,
      'lichsu_khoitao': instance.l1_lichsu_khoitao,
      'tongtien': instance.tongtien,
      'lichsu_capnhat': instance.lichsu_capnhat,
    };

_$_L1_info _$$_L1_infoFromJson(Map<String, dynamic> json) => _$_L1_info(
      chucnang: json['chucnang'] as String?,
    );

Map<String, dynamic> _$$_L1_infoToJson(_$_L1_info instance) =>
    <String, dynamic>{
      'chucnang': instance.chucnang,
    };

_$_L1_lichsu_khoitao _$$_L1_lichsu_khoitaoFromJson(Map<String, dynamic> json) =>
    _$_L1_lichsu_khoitao(
      id: json['_id'] as String?,
      parentId: json['parentId'] as String?,
      manhanvien: json['manhanvien'] as String?,
      hoten: json['hoten'] as String?,
      l2_phongbanId: json['phongbanId'] == null
          ? null
          : L2_phongbanId.fromJson(json['phongbanId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_L1_lichsu_khoitaoToJson(
        _$_L1_lichsu_khoitao instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'parentId': instance.parentId,
      'manhanvien': instance.manhanvien,
      'hoten': instance.hoten,
      'phongbanId': instance.l2_phongbanId,
    };

_$_L2_phongbanId _$$_L2_phongbanIdFromJson(Map<String, dynamic> json) =>
    _$_L2_phongbanId(
      id: json['_id'] as String?,
      maphongban: json['maphongban'] as String?,
      manhanh: json['manhanh'] as String?,
      tenphongban: json['tenphongban'] as String?,
    );

Map<String, dynamic> _$$_L2_phongbanIdToJson(_$_L2_phongbanId instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'maphongban': instance.maphongban,
      'manhanh': instance.manhanh,
      'tenphongban': instance.tenphongban,
    };
