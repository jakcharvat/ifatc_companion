// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repr_value_spoken.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReprValueSpoken _$ReprValueSpokenFromJson(Map<String, dynamic> json) {
  return ReprValueSpoken(
    json['repr'] as String,
    json['value'] as num,
    json['spoken'] as String,
  );
}

Map<String, dynamic> _$ReprValueSpokenToJson(ReprValueSpoken instance) =>
    <String, dynamic>{
      'repr': instance.repr,
      'value': instance.value,
      'spoken': instance.spoken,
    };
