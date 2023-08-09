// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_search_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemSearchResultModel _$$_ItemSearchResultModelFromJson(
        Map<String, dynamic> json) =>
    _$_ItemSearchResultModel(
      l1_lichsu_khoitao: json['lichsu_khoitao'] == null
          ? null
          : L1_lichsu_khoitao.fromJson(
              json['lichsu_khoitao'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      sohopdong: json['sohopdong'] as String?,
      sohopdongcu: json['sohopdongcu'] as String?,
      namhopdong: json['namhopdong'] as String?,
      mahopdong: json['mahopdong'] as String?,
      loaihopdong: json['loaihopdong'] as String?,
      ngaykyhd: json['ngaykyhd'] as String?,
      l1_khachhangId: json['khachhangId'] == null
          ? null
          : L1_khachhangId.fromJson(
              json['khachhangId'] as Map<String, dynamic>),
      nhanvien: json['nhanvien'] as List<dynamic>?,
      ghichu: json['ghichu'] as String?,
      l1_info: json['info'] == null
          ? null
          : L1_info.fromJson(json['info'] as Map<String, dynamic>),
      dichvuIds: json['dichvuIds'] as List<dynamic>?,
      tenhopdong: json['tenhopdong'] as String?,
      lichsu_capnhat: json['lichsu_capnhat'] as List<dynamic>?,
      tongtien: json['tongtien'] as int?,
      files: json['files'] as List<dynamic>?,
      tenhosting: json['tenhosting'] as String?,
      dungluong: json['dungluong'] as int?,
      sonamdangky: json['sonamdangky'] as int?,
      ngaydangky: json['ngaydangky'] as String?,
      ngayhethan: json['ngayhethan'] as String?,
      tenapp: json['tenapp'] as String?,
      tenmien: json['tenmien'] as String?,
      danhsachtenmien: json['danhsachtenmien'] as List<dynamic>?,
      chucnang: json['chucnang'] as String?,
      mota: json['mota'] as String?,
      trangthai_hosting: json['trangthai_hosting'] as String?,
      lichsu_thanhtoan: json['lichsu_thanhtoan'] as List<dynamic>?,
      ngaybangiao: json['ngaybangiao'] as String?,
      ngaykichhoat: json['ngaykichhoat'] as String?,
      ngayupstore: json['ngayupstore'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_ItemSearchResultModelToJson(
        _$_ItemSearchResultModel instance) =>
    <String, dynamic>{
      'lichsu_khoitao': instance.l1_lichsu_khoitao,
      '_id': instance.id,
      'sohopdong': instance.sohopdong,
      'sohopdongcu': instance.sohopdongcu,
      'namhopdong': instance.namhopdong,
      'mahopdong': instance.mahopdong,
      'loaihopdong': instance.loaihopdong,
      'ngaykyhd': instance.ngaykyhd,
      'khachhangId': instance.l1_khachhangId,
      'nhanvien': instance.nhanvien,
      'ghichu': instance.ghichu,
      'info': instance.l1_info,
      'dichvuIds': instance.dichvuIds,
      'tenhopdong': instance.tenhopdong,
      'lichsu_capnhat': instance.lichsu_capnhat,
      'tongtien': instance.tongtien,
      'files': instance.files,
      'tenhosting': instance.tenhosting,
      'dungluong': instance.dungluong,
      'sonamdangky': instance.sonamdangky,
      'ngaydangky': instance.ngaydangky,
      'ngayhethan': instance.ngayhethan,
      'tenapp': instance.tenapp,
      'tenmien': instance.tenmien,
      'danhsachtenmien': instance.danhsachtenmien,
      'chucnang': instance.chucnang,
      'mota': instance.mota,
      'trangthai_hosting': instance.trangthai_hosting,
      'lichsu_thanhtoan': instance.lichsu_thanhtoan,
      'ngaybangiao': instance.ngaybangiao,
      'ngaykichhoat': instance.ngaykichhoat,
      'ngayupstore': instance.ngayupstore,
    };

_$_L1_lichsu_khoitao _$$_L1_lichsu_khoitaoFromJson(Map<String, dynamic> json) =>
    _$_L1_lichsu_khoitao(
      l2_parentId: json['parentId'] == null
          ? null
          : L2_parentId.fromJson(json['parentId'] as Map<String, dynamic>),
      l2_phongbanId: json['phongbanId'] == null
          ? null
          : L2_phongbanId.fromJson(json['phongbanId'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      manhanvien: json['manhanvien'] as String?,
      hoten: json['hoten'] as String?,
    );

Map<String, dynamic> _$$_L1_lichsu_khoitaoToJson(
        _$_L1_lichsu_khoitao instance) =>
    <String, dynamic>{
      'parentId': instance.l2_parentId,
      'phongbanId': instance.l2_phongbanId,
      '_id': instance.id,
      'manhanvien': instance.manhanvien,
      'hoten': instance.hoten,
    };

_$_L1_khachhangId _$$_L1_khachhangIdFromJson(Map<String, dynamic> json) =>
    _$_L1_khachhangId(
      l2_lichsu_khoitao: json['lichsu_khoitao'] == null
          ? null
          : L2_lichsu_khoitao.fromJson(
              json['lichsu_khoitao'] as Map<String, dynamic>),
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
      l2_info: json['info'] == null
          ? null
          : L2_info.fromJson(json['info'] as Map<String, dynamic>),
      ghichu: json['ghichu'] as String?,
      lichsu_capnhat: json['lichsu_capnhat'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_L1_khachhangIdToJson(_$_L1_khachhangId instance) =>
    <String, dynamic>{
      'lichsu_khoitao': instance.l2_lichsu_khoitao,
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
      'info': instance.l2_info,
      'ghichu': instance.ghichu,
      'lichsu_capnhat': instance.lichsu_capnhat,
    };

_$_L1_info _$$_L1_infoFromJson(Map<String, dynamic> json) => _$_L1_info(
      danhsachtenmien: json['danhsachtenmien'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_L1_infoToJson(_$_L1_info instance) =>
    <String, dynamic>{
      'danhsachtenmien': instance.danhsachtenmien,
    };

_$_L2_parentId _$$_L2_parentIdFromJson(Map<String, dynamic> json) =>
    _$_L2_parentId(
      id: json['_id'] as String?,
      manhanvien: json['manhanvien'] as String?,
      hoten: json['hoten'] as String?,
      manhanh: json['manhanh'] as String?,
    );

Map<String, dynamic> _$$_L2_parentIdToJson(_$_L2_parentId instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'manhanvien': instance.manhanvien,
      'hoten': instance.hoten,
      'manhanh': instance.manhanh,
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

_$_L2_lichsu_khoitao _$$_L2_lichsu_khoitaoFromJson(Map<String, dynamic> json) =>
    _$_L2_lichsu_khoitao(
      l3_parentId: json['parentId'] == null
          ? null
          : L3_parentId.fromJson(json['parentId'] as Map<String, dynamic>),
      l3_phongbanId: json['phongbanId'] == null
          ? null
          : L3_phongbanId.fromJson(json['phongbanId'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      manhanvien: json['manhanvien'] as String?,
      hoten: json['hoten'] as String?,
    );

Map<String, dynamic> _$$_L2_lichsu_khoitaoToJson(
        _$_L2_lichsu_khoitao instance) =>
    <String, dynamic>{
      'parentId': instance.l3_parentId,
      'phongbanId': instance.l3_phongbanId,
      '_id': instance.id,
      'manhanvien': instance.manhanvien,
      'hoten': instance.hoten,
    };

_$_L2_info _$$_L2_infoFromJson(Map<String, dynamic> json) => _$_L2_info(
      fax: json['fax'] as String?,
      email_phu: json['email_phu'] as String?,
    );

Map<String, dynamic> _$$_L2_infoToJson(_$_L2_info instance) =>
    <String, dynamic>{
      'fax': instance.fax,
      'email_phu': instance.email_phu,
    };

_$_L3_parentId _$$_L3_parentIdFromJson(Map<String, dynamic> json) =>
    _$_L3_parentId(
      id: json['_id'] as String?,
      manhanvien: json['manhanvien'] as String?,
      hoten: json['hoten'] as String?,
      manhanh: json['manhanh'] as String?,
    );

Map<String, dynamic> _$$_L3_parentIdToJson(_$_L3_parentId instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'manhanvien': instance.manhanvien,
      'hoten': instance.hoten,
      'manhanh': instance.manhanh,
    };

_$_L3_phongbanId _$$_L3_phongbanIdFromJson(Map<String, dynamic> json) =>
    _$_L3_phongbanId(
      id: json['_id'] as String?,
      maphongban: json['maphongban'] as String?,
      manhanh: json['manhanh'] as String?,
      tenphongban: json['tenphongban'] as String?,
    );

Map<String, dynamic> _$$_L3_phongbanIdToJson(_$_L3_phongbanId instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'maphongban': instance.maphongban,
      'manhanh': instance.manhanh,
      'tenphongban': instance.tenphongban,
    };
