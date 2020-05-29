// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'if_fpls_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IfFplsResponse _$IfFplsResponseFromJson(Map<String, dynamic> json) {
  return IfFplsResponse(
    json['FlightID'] as String,
    (json['Waypoints'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$IfFplsResponseToJson(IfFplsResponse instance) =>
    <String, dynamic>{
      'FlightID': instance.flightId,
      'Waypoints': instance.waypoints,
    };
