import 'package:atc_companion/state/flights.dart';
import 'package:flutter_test/flutter_test.dart';

import '../res/test_flights.dart';

void main() {
  test('Flight State Test', () {
    final FlightsState state = FlightsState();
    expect(state.flights.isEmpty, true);

    state.flights = testFlights.sublist(1);

    expect(state.flights.length, 2);
    expect(state.flights[0], testFlights[1]);

    state.clearFlights();

    expect(state.flights.isEmpty, true);

    state.addFlight(testFlights[0]);
    state.addFlight(testFlights[1]);

    expect(state.flights, testFlights.sublist(0, 2));

    state.updateFlight(0, testFlights[2]);

    expect(state.flights, [testFlights[2], testFlights[1]]);

    state.removeFlight(0);

    expect(state.flights, [testFlights[1]]);

    state.clearFlights();

    expect(state.flights.isEmpty, true);
  });
}