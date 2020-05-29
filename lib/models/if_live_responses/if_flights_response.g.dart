// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'if_flights_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IfFlightsResponse _$IfFlightsResponseFromJson(Map<String, dynamic> json) {
  return IfFlightsResponse(
    json['FlightID'] as String,
    json['AircraftID'] as String,
    (json['Latitude'] as num)?.toDouble(),
    (json['Longitude'] as num)?.toDouble(),
    json['CallSign'] as String,
  );
}

Map<String, dynamic> _$IfFlightsResponseToJson(IfFlightsResponse instance) =>
    <String, dynamic>{
      'FlightID': instance.flightId,
      'AircraftID': instance.aircraftId,
      'Latitude': instance.latitude,
      'Longitude': instance.longitude,
      'CallSign': instance.callsign,
    };
