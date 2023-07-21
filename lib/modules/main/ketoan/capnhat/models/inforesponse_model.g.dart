// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inforesponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InfoResponseModel _$$_InfoResponseModelFromJson(Map<String, dynamic> json) =>
    _$_InfoResponseModel(
      countActivated: json['countActivated'] as int?,
      countTrashed: json['countTrashed'] as int?,
      total: json['total'] as int?,
      limit: json['limit'] as int?,
      page: json['page'] as int?,
      lastPage: json['lastPage'] as int?,
    );

Map<String, dynamic> _$$_InfoResponseModelToJson(
        _$_InfoResponseModel instance) =>
    <String, dynamic>{
      'countActivated': instance.countActivated,
      'countTrashed': instance.countTrashed,
      'total': instance.total,
      'limit': instance.limit,
      'page': instance.page,
      'lastPage': instance.lastPage,
    };
