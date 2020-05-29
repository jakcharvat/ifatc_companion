import 'dart:async';
import 'dart:convert';

import 'package:atc_companion/consts.dart';
import 'package:atc_companion/models/avwx_responses/avwx_metar_response.dart';
import 'package:atc_companion/models/avwx_responses/avwx_station_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/airport.dart';

class AirportState extends ChangeNotifier {
  Airport _airport;
  List<String> _icaos;

  Airport get airport => _airport;
  set airport(Airport a) {
    _airport = a;
    notifyListeners();
  }

  List<String> get icaos => _icaos;
  set icaos(List<String> i) {
    _icaos = i;
    notifyListeners();
  }


  void getIcaos() async {
    final csv = (await http.get('https://datahub.io/core/airport-codes/r/0.csv')).body;
    final list = csv.split('\n').map((e) => e.split(',').first).where((element) => element.length == 4).toList();
    icaos = list;
  }


  void getAirport(String icao, {@required VoidCallback callback, @required VoidCallback onError}) async {
    Timer timeout = Timer(Duration(seconds: 10), () {
      if (onError != null) onError();
    });

    final responses = await Future.wait([_getAirportDetails(icao), _getWeather(icao), _getStation(icao)]);

    timeout.cancel();

    final details = responses[0] as List<String>;
    final weather = responses[1] as AvwxMetarResponse;
    final station = responses[2] as AvwxStationResponse;

    airport = Airport(
      icao: icao,
      name: details != null ? details[0] : "Unable to fetch airport name",
      city: station.city,
      country: details != null ? details[2] : "Unable to fetch airport country",
      rwys: station.runways,
      elevation: station.elevationFt,
      weather: weather,
    );

    if (callback != null) {
      callback();
    }
  }


  Future<List<String>> _getAirportDetails(String icao) async {
    final http.Response response = await http.get(URLs.airportInfoURL(icao), headers: {
      "x-rapidapi-host": "airport-info.p.rapidapi.com",
		  "x-rapidapi-key": "9558d7d20amshdd2dcfe214565b6p121d7bjsn09b77692ed64"
    });

    try {
      final Map<String, dynamic> json = JsonDecoder().convert(response.body);

      final name = json['name'];
      final city = json['city'];
      final country = json['country'];

      return [name, city, country];
    } catch(error) {
      print(error);
      return null;
    }
  }


  Future<AvwxMetarResponse> _getWeather(String icao) async {
    final http.Response response = await http.get(URLs.metarURL(icao), headers: {
      'Authorization': 'Token oBNZPwjXRmtgH1ZnqEtOkitduo73gyPmbnP3wRGZDHA'
    });
    final Map<String, dynamic> json = JsonDecoder().convert(response.body);
    final AvwxMetarResponse metarResponse = AvwxMetarResponse.fromJson(json);

    return metarResponse;
  }
  
  
  Future<AvwxStationResponse> _getStation(String icao) async {
    final http.Response response = await http.get(URLs.stationUrl(icao), headers: {
      'Authorization': 'Token oBNZPwjXRmtgH1ZnqEtOkitduo73gyPmbnP3wRGZDHA'
    });
    final Map<String, dynamic> json = JsonDecoder().convert(response.body);
    final AvwxStationResponse stationResponse = AvwxStationResponse.fromJson(json);

    return stationResponse;
  }


  void discardAirport() => airport = null;
}