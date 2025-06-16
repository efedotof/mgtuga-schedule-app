// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupModelImpl _$$GroupModelImplFromJson(Map<String, dynamic> json) =>
    _$GroupModelImpl(
      type: json['type'] as String,
      id: json['id'] as String,
      label: json['label'] as String,
      description: json['description'] as String,
      guid: json['guid'] as String,
    );

Map<String, dynamic> _$$GroupModelImplToJson(_$GroupModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'label': instance.label,
      'description': instance.description,
      'guid': instance.guid,
    };
