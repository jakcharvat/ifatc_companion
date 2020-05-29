// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avwx_station_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvwxStationResponse _$AvwxStationResponseFromJson(Map<String, dynamic> json) {
  return AvwxStationResponse(
    json['city'] as String,
    json['country'] as String,
    json['elevation_ft'] as int,
    json['elevation_m'] as int,
    json['iata'] as String,
    json['icao'] as String,
    (json['latitude'] as num)?.toDouble(),
    (json['longitude'] as num)?.toDouble(),
    json['name'] as String,
    json['note'] as String,
    json['reporting'] as bool,
    (json['runways'] as List)
        ?.map((e) =>
            e == null ? null : Runway.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['state'] as String,
    json['type'] as String,
    json['website'] as String,
    json['wiki'] as String,
  );
}

Map<String, dynamic> _$AvwxStationResponseToJson(
        AvwxStationResponse instance) =>
    <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
      'elevation_ft': instance.elevationFt,
      'elevation_m': instance.elevationM,
      'iata': instance.iata,
      'icao': instance.icao,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'name': instance.name,
      'note': instance.note,
      'reporting': instance.reporting,
      'runways': instance.runways?.map((e) => e?.toJson())?.toList(),
      'state': instance.state,
      'type': instance.type,
      'website': instance.website,
      'wiki': instance.wiki,
    };
