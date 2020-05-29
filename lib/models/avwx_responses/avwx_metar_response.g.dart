// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avwx_metar_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvwxMetarResponse _$AvwxMetarResponseFromJson(Map<String, dynamic> json) {
  return AvwxMetarResponse(
    json['altimeter'] == null
        ? null
        : ReprValueSpoken.fromJson(json['altimeter'] as Map<String, dynamic>),
    (json['clouds'] as List)
        ?.map(
            (e) => e == null ? null : Cloud.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['flight_rules'] as String,
    json['sanitized'] as String,
    json['visibility'] == null
        ? null
        : ReprValueSpoken.fromJson(json['visibility'] as Map<String, dynamic>),
    json['wind_direction'] == null
        ? null
        : ReprValueSpoken.fromJson(
            json['wind_direction'] as Map<String, dynamic>),
    json['wind_speed'] == null
        ? null
        : ReprValueSpoken.fromJson(json['wind_speed'] as Map<String, dynamic>),
    json['raw'] as String,
    json['station'] as String,
    json['remarks'] as String,
    json['dewpoint'] == null
        ? null
        : ReprValueSpoken.fromJson(json['dewpoint'] as Map<String, dynamic>),
    json['temperature'] == null
        ? null
        : ReprValueSpoken.fromJson(json['temperature'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AvwxMetarResponseToJson(AvwxMetarResponse instance) =>
    <String, dynamic>{
      'altimeter': instance.altimeter?.toJson(),
      'clouds': instance.clouds?.map((e) => e?.toJson())?.toList(),
      'flight_rules': instance.flightRules,
      'sanitized': instance.sanitized,
      'visibility': instance.visibility?.toJson(),
      'wind_direction': instance.windDirection?.toJson(),
      'wind_speed': instance.windSpeed?.toJson(),
      'raw': instance.raw,
      'station': instance.station,
      'remarks': instance.remarks,
      'dewpoint': instance.dewpoint?.toJson(),
      'temperature': instance.temperature?.toJson(),
    };
