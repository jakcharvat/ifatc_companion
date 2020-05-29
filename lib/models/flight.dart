import './enums.dart';
import './flight_parameters.dart';


class Flight {
  const Flight({
    this.flightDirection,
    this.time,
    this.type,
    this.callsign,
    this.squawk,
    this.flightRules,
    this.airportIcao,
    this.parameters,
    this.fpl,
    this.rwy,
    this.isEmergency,
  });

  final FlightDirection flightDirection;
  final String time;
  final AircraftType type;
  final String callsign;
  final String squawk;
  final FlightRules flightRules;
  final String airportIcao;
  final FlightParameters parameters;
  final String fpl;
  final String rwy;
  final bool isEmergency;
}