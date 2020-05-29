import 'package:atc_companion/models/enums.dart';
import 'package:atc_companion/models/flight.dart';
import 'package:atc_companion/models/flight_parameters.dart';

const testFlights = [
  Flight(
    airportIcao: 'LKPR',
    callsign: 'CSA31NT',
    flightDirection: FlightDirection.inbound,
    flightRules: FlightRules.IFR,
    fpl:
        'DET2F DET L6 DVR UL9 KONAN UL607 MATUG UZ660 RASPU UL984 SULUS UZ650 TONSU LKPR',
    parameters: FlightParameters(
      assignedAlt: Altitude(4000),
      currentAlt: Altitude(6790),
      assignedHdg: 150,
      currentHdg: 091,
      assignedIas: 180,
      currentIas: 213,
    ),
    rwy: '24',
    squawk: '2394',
    time: '0830',
    type: AircraftType.a359,
  ),
  Flight(
    airportIcao: 'EGLL',
    callsign: 'BAW21',
    flightDirection: FlightDirection.outbound,
    flightRules: FlightRules.IFR,
    fpl: 'EGLL BALTU DONAN PR623 PR625',
    parameters: FlightParameters(
      assignedAlt: Altitude(12000),
      currentAlt: Altitude(568),
      assignedHdg: 130,
      currentHdg: 183,
      assignedIas: 240,
      currentIas: 163,
    ),
    rwy: '27R',
    squawk: '4421',
    time: '1246',
    type: AircraftType.a319,
  ),
  Flight(
    airportIcao: 'LKRO',
    callsign: 'OK-JAK',
    flightDirection: FlightDirection.inbound,
    flightRules: FlightRules.VFR,
    fpl: '',
    parameters: FlightParameters(
      assignedAlt: null,
      currentAlt: Altitude(1000),
      assignedHdg: null,
      currentHdg: 213,
      assignedIas: null,
      currentIas: 98,
    ),
    rwy: '24',
    squawk: '1200',
    time: '1343',
    type: AircraftType.c172,
  ),
];