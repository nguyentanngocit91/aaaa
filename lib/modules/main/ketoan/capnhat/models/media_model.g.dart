// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MediaModel _$$_MediaModelFromJson(Map<String, dynamic> json) =>
    _$_MediaModel(
      id: json['_id'] as String?,
      folderId: json['folderId'] as String?,
      sohopdong: json['sohopdong'] as String?,
      hopdongId: json['hopdongId'] as String?,
      loaifile: json['loaifile'] as String?,
      ghichu: json['ghichu'] as String?,
      originalname: json['originalname'] as String?,
      filename: json['filename'] as String?,
      path: json['path'] as String?,
      destination: json['destination'] as String?,
      size: json['size'] as int?,
      folder: json['folder'] as String?,
      mimetype: json['mimetype'] as String?,
      ext: json['ext'] as String?,
      l1_lichsu_khoitao: json['lichsu_khoitao'] == null
          ? null
          : L1_lichsu_khoitao.fromJson(
              json['lichsu_khoitao'] as Map<String, dynamic>),
      lichsu_capnhat: json['lichsu_capnhat'] as List<dynamic>?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_MediaModelToJson(_$_MediaModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'folderId': instance.folderId,
      'sohopdong': instance.sohopdong,
      'hopdongId': instance.hopdongId,
      'loaifile': instance.loaifile,
      'ghichu': instance.ghichu,
      'originalname': instance.originalname,
      'filename': instance.filename,
      'path': instance.path,
      'destination': instance.destination,
      'size': instance.size,
      'folder': instance.folder,
      'mimetype': instance.mimetype,
      'ext': instance.ext,
      'lichsu_khoitao': instance.l1_lichsu_khoitao,
      'lichsu_capnhat': instance.lichsu_capnhat,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$_L1_lichsu_khoitao _$$_L1_lichsu_khoitaoFromJson(Map<String, dynamic> json) =>
    _$_L1_lichsu_khoitao(
      id: json['_id'] as String?,
      manhanvien: json['manhanvien'] as String?,
      hoten: json['hoten'] as String?,
      phongbanId: json['phongbanId'] as String?,
      ngaykhoitao: json['ngaykhoitao'] as String?,
    );

Map<String, dynamic> _$$_L1_lichsu_khoitaoToJson(
        _$_L1_lichsu_khoitao instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'manhanvien': instance.manhanvien,
      'hoten': instance.hoten,
      'phongbanId': instance.phongbanId,
      'ngaykhoitao': instance.ngaykhoitao,
    };
