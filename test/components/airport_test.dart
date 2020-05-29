import 'package:flutter_test/flutter_test.dart';

import 'package:atc_companion/state/airport.dart';

import '../res/test_airport.dart';

void main() {
  test('Airport init test', () {
    final AirportState airportState = AirportState();
    expect(airportState.airport, null);

    airportState.airport = testAirport;

    expect(airportState.airport, testAirport);
  });
}