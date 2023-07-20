// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      l1_actived: json['actived'] == null
          ? null
          : L1_actived.fromJson(json['actived'] as Map<String, dynamic>),
      l1_locked: json['locked'] == null
          ? null
          : L1_locked.fromJson(json['locked'] as Map<String, dynamic>),
      l1_permission: json['permission'] == null
          ? null
          : L1_permission.fromJson(json['permission'] as Map<String, dynamic>),
      l1_trashed: json['trashed'] == null
          ? null
          : L1_trashed.fromJson(json['trashed'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      manhanvien: json['manhanvien'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      token: json['token'] as String?,
      role: json['role'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      dataversion: json['__v'] as int?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'actived': instance.l1_actived,
      'locked': instance.l1_locked,
      'permission': instance.l1_permission,
      'trashed': instance.l1_trashed,
      '_id': instance.id,
      'manhanvien': instance.manhanvien,
      'username': instance.username,
      'password': instance.password,
      'token': instance.token,
      'role': instance.role,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.dataversion,
    };

_$_L1_actived _$$_L1_activedFromJson(Map<String, dynamic> json) =>
    _$_L1_actived(
      check: json['check'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_L1_activedToJson(_$_L1_actived instance) =>
    <String, dynamic>{
      'check': instance.check,
      'message': instance.message,
    };

_$_L1_locked _$$_L1_lockedFromJson(Map<String, dynamic> json) => _$_L1_locked(
      check: json['check'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_L1_lockedToJson(_$_L1_locked instance) =>
    <String, dynamic>{
      'check': instance.check,
      'message': instance.message,
    };

_$_L1_permission _$$_L1_permissionFromJson(Map<String, dynamic> json) =>
    _$_L1_permission(
      check: json['check'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_L1_permissionToJson(_$_L1_permission instance) =>
    <String, dynamic>{
      'check': instance.check,
      'message': instance.message,
    };

_$_L1_trashed _$$_L1_trashedFromJson(Map<String, dynamic> json) =>
    _$_L1_trashed(
      check: json['check'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_L1_trashedToJson(_$_L1_trashed instance) =>
    <String, dynamic>{
      'check': instance.check,
      'message': instance.message,
    };
