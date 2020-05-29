import 'package:atc_companion/models/avwx_responses/avwx_metar_response.dart';

import 'avwx_responses/runway.dart';

class Airport {
  const Airport({
    this.icao,
    this.name,
    this.city,
    this.country,
    this.elevation,
    this.weather,
    this.rwys,
  });

  final String icao,
    name,
    city,
    country;
  final int elevation;    // feet
  final AvwxMetarResponse weather;
  final List<Runway> rwys;
}