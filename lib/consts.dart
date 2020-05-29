import 'package:flutter/material.dart';

const Color backgroundColorLight = Color(0xFFF8F8F8);
const Color backgroundColorDark = Color(0xFF111111);
const Color primaryColorLightest = Color(0xFFB8AEFF);
const Color primaryColorLighter = Color(0xFF9081FF);
const Color primaryColor = Color(0xFF5A44FF);
const Color primaryColorDarker = Color(0xFF1A00DB);
const Color primaryColorDarkest = Color(0xFF0E0075);
const Color splitterColor = Color(0xFFBEBEBE);
const Color tooltipColor = Color(0xFF646464);
const Color departureStripColor = Color(0xFF5A44FF);
const Color arrivalStripColor = Color(0xFFFFA144);
const Color lightBoxColor = Color(0xFFEBE9E9);
const Color darkBoxColor = Color(0xFF272727);

class URLs {
  static const String _IF_API_KEY = "35f43e73-c592-4ed6-8849-0965db7e2df7";

  static const String IF_SESSIONS_INFO_URL = 'http://infinite-flight-public-api.cloudapp.net/v1/GetSessionsInfo.aspx?apikey=$_IF_API_KEY';
  static String flights(String session, { bool stationsOnly = true }) => 'http://infinite-flight-public-api.cloudapp.net/v1/Flights.aspx?apikey=$_IF_API_KEY&sessionId=$session&stationsOnly=$stationsOnly';
  static String flightPlans(String session) => 'http://infinite-flight-public-api.cloudapp.net/v1/GetFlightPlans.aspx?apikey=$_IF_API_KEY&sessionid=$session';
  static const String IF_ACTIVE_FACILITIES_URL = 'http://infinite-flight-public-api.cloudapp.net/v1/GetATCFacilities.aspx?apikey=$_IF_API_KEY&sessionid=7e5dcd44-1fb5-49cc-bc2c-a9aab1f6a856';
  static String airportInfoURL(String icao) => 'https://airport-info.p.rapidapi.com/airport?icao=$icao';
  static String metarURL(String icao) => 'https://avwx.rest/api/metar/$icao';
  static String stationUrl(String icao) => 'https://avwx.rest/api/station/$icao';
}