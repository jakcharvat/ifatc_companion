import 'package:atc_companion/models/avwx_responses/cloud.dart';
import 'package:atc_companion/models/avwx_responses/repr_value_spoken.dart';
import 'package:json_annotation/json_annotation.dart';

part 'avwx_metar_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AvwxMetarResponse {
  final ReprValueSpoken altimeter;
  final List<Cloud> clouds;
  @JsonKey(name: 'flight_rules') final String flightRules;
  final String sanitized;
  final ReprValueSpoken visibility;
  @JsonKey(name: 'wind_direction') final ReprValueSpoken windDirection;
  @JsonKey(name: 'wind_speed') final ReprValueSpoken windSpeed;
  final String raw;
  final String station;
  final String remarks;
  final ReprValueSpoken dewpoint;
  final ReprValueSpoken temperature;

  AvwxMetarResponse(
    this.altimeter,
    this.clouds,
    this.flightRules,
    this.sanitized,
    this.visibility,
    this.windDirection,
    this.windSpeed,
    this.raw,
    this.station,
    this.remarks,
    this.dewpoint,
    this.temperature
  );

  factory AvwxMetarResponse.fromJson(Map<String, dynamic> json) => _$AvwxMetarResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AvwxMetarResponseToJson(this);
}