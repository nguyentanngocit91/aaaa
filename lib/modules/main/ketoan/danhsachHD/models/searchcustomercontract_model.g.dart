// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchcustomercontract_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchCustomerContractModel _$$_SearchCustomerContractModelFromJson(
        Map<String, dynamic> json) =>
    _$_SearchCustomerContractModel(
      id: json['_id'] as String?,
      sohopdong: json['sohopdong'] as String?,
      sohopdongcu: json['sohopdongcu'] as String?,
      loaihopdong: json['loaihopdong'] as String?,
      mahopdong: json['mahopdong'] as String?,
      khachhangId: json['khachhangId'] as String?,
      nhanvien: json['nhanvien'] as List<dynamic>?,
      dichvuIds: json['dichvuIds'] as List<dynamic>?,
      tenhopdong: json['tenhopdong'] as String?,
      tongtien: json['tongtien'] as int?,
      files: json['files'] as List<dynamic>?,
      ngayhethan: json['ngayhethan'] as String?,
      tenapp: json['tenapp'] as String?,
      tenmien: json['tenmien'] as String?,
      danhsachtenmien: json['danhsachtenmien'] as List<dynamic>?,
      chucnang: json['chucnang'] as String?,
      mota: json['mota'] as String?,
      dungluong: json['dungluong'] as int?,
      sonamdangky: json['sonamdangky'] as int?,
      ngaydangky: json['ngaydangky'] as String?,
      ngaybangiao: json['ngaybangiao'] as String?,
      ngayupstore: json['ngayupstore'] as List<dynamic>?,
      ngaykyhd: json['ngaykyhd'] as String?,
      ngaykichhoat: json['ngaykichhoat'] as String?,
      info: json['info'] as String?,
      ghichu: json['ghichu'] as String?,
      trangthai_hosting: json['trangthai_hosting'] as String?,
      lichsu_thanhtoan: json['lichsu_thanhtoan'] as List<dynamic>?,
      l1_lichsu_khoitao: json['lichsu_khoitao'] == null
          ? null
          : L1_lichsu_khoitao.fromJson(
              json['lichsu_khoitao'] as Map<String, dynamic>),
      lichsu_capnhat: json['lichsu_capnhat'] as List<dynamic>?,
      namhopdong: json['namhopdong'] as String?,
    );

Map<String, dynamic> _$$_SearchCustomerContractModelToJson(
        _$_SearchCustomerContractModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'sohopdong': instance.sohopdong,
      'sohopdongcu': instance.sohopdongcu,
      'loaihopdong': instance.loaihopdong,
      'mahopdong': instance.mahopdong,
      'khachhangId': instance.khachhangId,
      'nhanvien': instance.nhanvien,
      'dichvuIds': instance.dichvuIds,
      'tenhopdong': instance.tenhopdong,
      'tongtien': instance.tongtien,
      'files': instance.files,
      'ngayhethan': instance.ngayhethan,
      'tenapp': instance.tenapp,
      'tenmien': instance.tenmien,
      'danhsachtenmien': instance.danhsachtenmien,
      'chucnang': instance.chucnang,
      'mota': instance.mota,
      'dungluong': instance.dungluong,
      'sonamdangky': instance.sonamdangky,
      'ngaydangky': instance.ngaydangky,
      'ngaybangiao': instance.ngaybangiao,
      'ngayupstore': instance.ngayupstore,
      'ngaykyhd': instance.ngaykyhd,
      'ngaykichhoat': instance.ngaykichhoat,
      'info': instance.info,
      'ghichu': instance.ghichu,
      'trangthai_hosting': instance.trangthai_hosting,
      'lichsu_thanhtoan': instance.lichsu_thanhtoan,
      'lichsu_khoitao': instance.l1_lichsu_khoitao,
      'lichsu_capnhat': instance.lichsu_capnhat,
      'namhopdong': instance.namhopdong,
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
