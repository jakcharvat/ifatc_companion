import 'dart:convert';

import 'package:atc_companion/consts.dart';
import 'package:atc_companion/models/enums.dart';
import 'package:atc_companion/models/flight_parameters.dart';
import 'package:atc_companion/utils/haversine.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/flight.dart';
import '../models/if_live_responses/if_flights_response.dart';
import '../models/if_live_responses/if_fpls_response.dart';


class FlightsState extends ChangeNotifier {
  List<Flight> _flights = [];

  List<Flight> get flights => List.unmodifiable(_flights);
  set flights(List<Flight> flights) {
    _flights = flights;
    notifyListeners();
  }

  getFlights(String icao, List<double> airportPosition) async {
    final sessions = (await http.get(URLs.IF_SESSIONS_INFO_URL)).body;
    final sessionsJson = JsonDecoder().convert(sessions) as List<dynamic>;

    final expert = sessionsJson.firstWhere((element) {
      final String name = element["Name"];

      return name != null && name.contains("Expert") && !name.contains("[X]");
    });
    final id = expert["Id"];
    print(id);

    final flightsBody = (await http.get(URLs.flights(id, stationsOnly: true))).body;
    final flightsJSON = JsonDecoder().convert(flightsBody) as List;
    final flights = flightsJSON.map((flight) => IfFlightsResponse.fromJson(flight)).where((flight) {
      final distanceM = Haversine.fromDegrees(
        latitude1: flight.latitude, 
        longitude1: flight.longitude,
        latitude2: airportPosition[0],
        longitude2: airportPosition[1],
      ).distance();
      
      final distanceNM = distanceM / 1852;
      return distanceNM <= 75;
    });

    final fplsBody = (await http.get(URLs.flightPlans(id))).body;
    final fplsJson = JsonDecoder().convert(fplsBody) as List;
    final fpls = fplsJson.map((fpl) => IfFplsResponse.fromJson(fpl)).where((fpl) {
      final inRange = flights.where((flight) => flight.flightId == fpl.flightId).length > 0;
      return inRange && fpl.waypoints.map((wpt) => wpt.toLowerCase()).contains(icao.toLowerCase());
    });

    fpls.forEach((fpl) {
      final flightInfo = flights.firstWhere((flight) => flight.flightId == fpl.flightId);

      final flight = Flight(
        airportIcao: icao,
        callsign: flightInfo.callsign,
        flightDirection: fpl.waypoints.last == icao ? FlightDirection.inbound : FlightDirection.outbound,
        fpl: fpl.waypoints.join(" "),
        flightRules: FlightRules.IFR,
        isEmergency: false,
        parameters: FlightParameters(
          assignedAlt: Altitude(0),
          assignedHdg: 0,
          assignedIas: 0,
          currentAlt: Altitude(0),
          currentHdg: 0,
          currentIas: 0
        ),
        rwy: "",
        squawk: "",
        time: "${DateTime.now().hour}".padLeft(2, "0") + "${DateTime.now().minute}".padLeft(2, "0"),
        type: AircraftType.a318
      );

      addFlight(flight);
    });
  }

  addFlight(Flight flight) {
    _flights.add(flight);
    notifyListeners();
  }

  removeFlight(int index) {
    _flights.removeAt(index);
    notifyListeners();
  }

  updateFlight(int index, Flight newFlight) {
    _flights[index] = newFlight;
    notifyListeners();
  }

  clearFlights() {
    _flights.clear();
    notifyListeners();
  }
}