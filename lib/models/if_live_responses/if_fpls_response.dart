import 'package:json_annotation/json_annotation.dart';

part 'if_fpls_response.g.dart';

@JsonSerializable()
class IfFplsResponse {
  @JsonKey(name: "FlightID") final String flightId;
  @JsonKey(name: "Waypoints") final List<String> waypoints;

  IfFplsResponse(this.flightId, this.waypoints);

  factory IfFplsResponse.fromJson(Map<String, dynamic> json) => _$IfFplsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$IfFplsResponseToJson(this);
}