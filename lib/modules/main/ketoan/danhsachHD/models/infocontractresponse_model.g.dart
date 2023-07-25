// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infocontractresponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InfoContractResponseModel _$$_InfoContractResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_InfoContractResponseModel(
      countActivated: json['countActivated'] as int?,
      countTrashed: json['countTrashed'] as int?,
      total: json['total'] as int?,
      limit: json['limit'] as int?,
      page: json['page'] as int?,
      lastPage: json['lastPage'] as int?,
    );

Map<String, dynamic> _$$_InfoContractResponseModelToJson(
        _$_InfoContractResponseModel instance) =>
    <String, dynamic>{
      'countActivated': instance.countActivated,
      'countTrashed': instance.countTrashed,
      'total': instance.total,
      'limit': instance.limit,
      'page': instance.page,
      'lastPage': instance.lastPage,
    };
