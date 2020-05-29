// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cloud _$CloudFromJson(Map<String, dynamic> json) {
  return Cloud(
    json['repr'] as String,
    json['type'] as String,
    json['altitude'] as int,
    json['modifier'] as Map<String, dynamic>,
    json['direction'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$CloudToJson(Cloud instance) => <String, dynamic>{
      'repr': instance.repr,
      'type': instance.type,
      'altitude': instance.altitude,
      'modifier': instance.modifier,
      'direction': instance.direction,
    };
