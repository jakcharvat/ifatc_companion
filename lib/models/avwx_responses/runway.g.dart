// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'runway.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Runway _$RunwayFromJson(Map<String, dynamic> json) {
  return Runway(
    json['length_ft'] as int,
    json['width_ft'] as int,
    json['ident1'] as String,
    json['ident2'] as String,
  );
}

Map<String, dynamic> _$RunwayToJson(Runway instance) => <String, dynamic>{
      'length_ft': instance.length,
      'width_ft': instance.width,
      'ident1': instance.end1,
      'ident2': instance.end2,
    };
