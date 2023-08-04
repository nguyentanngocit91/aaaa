// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_search_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemSearchResultModel _$$_ItemSearchResultModelFromJson(
        Map<String, dynamic> json) =>
    _$_ItemSearchResultModel(
      sohopdongcu: json['sohopdongcu'] as String?,
      dichvuIds: json['dichvuIds'] as List<dynamic>?,
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
      ngaykichhoat: json['ngaykichhoat'] as String?,
      trangthai_hosting: json['trangthai_hosting'] as String?,
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
      l1_khachhangId: json['khachhangId'] == null
          ? null
          : L1_khachhangId.fromJson(
              json['khachhangId'] as Map<String, dynamic>),
      tenhopdong: json['tenhopdong'] as String?,
      l1_lichsu_khoitao: json['lichsu_khoitao'] == null
          ? null
          : L1_lichsu_khoitao.fromJson(
              json['lichsu_khoitao'] as Map<String, dynamic>),
      tongtien: json['tongtien'] as int?,
      lichsu_capnhat: json['lichsu_capnhat'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_ItemSearchResultModelToJson(
        _$_ItemSearchResultModel instance) =>
    <String, dynamic>{
      'sohopdongcu': instance.sohopdongcu,
      'dichvuIds': instance.dichvuIds,
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
      'ngaykichhoat': instance.ngaykichhoat,
      'trangthai_hosting': instance.trangthai_hosting,
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
      'khachhangId': instance.l1_khachhangId,
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

_$_L1_khachhangId _$$_L1_khachhangIdFromJson(Map<String, dynamic> json) =>
    _$_L1_khachhangId(
      ghichu: json['ghichu'] as String?,
      lichsu_khoitao: json['lichsu_khoitao'] as String?,
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
      l2_info: json['info'] == null
          ? null
          : L2_info.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_L1_khachhangIdToJson(_$_L1_khachhangId instance) =>
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
      'info': instance.l2_info,
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

_$_L2_info _$$_L2_infoFromJson(Map<String, dynamic> json) => _$_L2_info(
      fax: json['fax'] as String?,
    );

Map<String, dynamic> _$$_L2_infoToJson(_$_L2_info instance) =>
    <String, dynamic>{
      'fax': instance.fax,
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
