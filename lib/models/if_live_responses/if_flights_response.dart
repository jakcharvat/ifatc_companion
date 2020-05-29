import 'package:json_annotation/json_annotation.dart';

part 'if_flights_response.g.dart';

@JsonSerializable()
class IfFlightsResponse {
  @JsonKey(name: "FlightID") final String flightId;
  @JsonKey(name: "AircraftID") final String aircraftId;
  @JsonKey(name: "Latitude") final double latitude;
  @JsonKey(name: "Longitude") final double longitude;
  @JsonKey(name: "CallSign") final String callsign;

  IfFlightsResponse(
    this.flightId,
    this.aircraftId,
    this.latitude,
    this.longitude,
    this.callsign,
  );

  factory IfFlightsResponse.fromJson(Map<String, dynamic> json) => _$IfFlightsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$IfFlightsResponseToJson(this);
}