// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MediaModel _$$_MediaModelFromJson(Map<String, dynamic> json) =>
    _$_MediaModel(
      l1_lichsu_khoitao: json['lichsu_khoitao'] == null
          ? null
          : L1_lichsu_khoitao.fromJson(
              json['lichsu_khoitao'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      folderId: json['folderId'] as String?,
      sohopdong: json['sohopdong'] as String?,
      khachhangId: json['khachhangId'] as String?,
      loaifile: json['loaifile'] as String?,
      loaimedia: json['loaimedia'] as String?,
      ghichu: json['ghichu'] as String?,
      originalname: json['originalname'] as String?,
      filename: json['filename'] as String?,
      path: json['path'] as String?,
      destination: json['destination'] as String?,
      size: json['size'] as int?,
      folder: json['folder'] as String?,
      mimetype: json['mimetype'] as String?,
      ext: json['ext'] as String?,
      lichsu_capnhat: json['lichsu_capnhat'] as List<dynamic>?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_MediaModelToJson(_$_MediaModel instance) =>
    <String, dynamic>{
      'lichsu_khoitao': instance.l1_lichsu_khoitao,
      '_id': instance.id,
      'folderId': instance.folderId,
      'sohopdong': instance.sohopdong,
      'khachhangId': instance.khachhangId,
      'loaifile': instance.loaifile,
      'loaimedia': instance.loaimedia,
      'ghichu': instance.ghichu,
      'originalname': instance.originalname,
      'filename': instance.filename,
      'path': instance.path,
      'destination': instance.destination,
      'size': instance.size,
      'folder': instance.folder,
      'mimetype': instance.mimetype,
      'ext': instance.ext,
      'lichsu_capnhat': instance.lichsu_capnhat,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$_L1_lichsu_khoitao _$$_L1_lichsu_khoitaoFromJson(Map<String, dynamic> json) =>
    _$_L1_lichsu_khoitao(
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
      'phongbanId': instance.l2_phongbanId,
      '_id': instance.id,
      'manhanvien': instance.manhanvien,
      'hoten': instance.hoten,
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
