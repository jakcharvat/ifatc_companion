import 'package:atc_companion/models/avwx_responses/runway.dart';
import 'package:json_annotation/json_annotation.dart';

part 'avwx_station_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AvwxStationResponse {
  final String city;
  final String country;
  @JsonKey(name: 'elevation_ft') final int elevationFt;
  @JsonKey(name: 'elevation_m') final int elevationM;
  final String iata;
  final String icao;
  final double latitude;
  final double longitude;
  final String name;
  final String note;
  final bool reporting;
  final List<Runway> runways;
  final String state;
  final String type;
  final String website;
  final String wiki;

  AvwxStationResponse(
      this.city,
      this.country,
      this.elevationFt,
      this.elevationM,
      this.iata,
      this.icao,
      this.latitude,
      this.longitude,
      this.name,
      this.note,
      this.reporting,
      this.runways,
      this.state,
      this.type,
      this.website,
      this.wiki,
  );

  factory AvwxStationResponse.fromJson(Map<String, dynamic> json) => _$AvwxStationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AvwxStationResponseToJson(this);
}