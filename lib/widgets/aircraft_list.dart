import 'package:atc_companion/models/enums.dart';
import 'package:atc_companion/state/flights.dart';
import 'package:atc_companion/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'strip.dart';

class AircraftList extends StatelessWidget {
  AircraftList(this.direction);

  final FlightDirection direction;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<FlightsState>(
        builder: (context, state, child) => Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: HeadingText(
                direction == FlightDirection.inbound
                    ? 'Arrivals'
                    : 'Departures',
              ),
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                // shrinkWrap: true,
                children: state.flights
                    .where((flight) => flight.flightDirection == direction)
                    .map((flight) => Strip(flight)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
