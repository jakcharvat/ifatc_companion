import 'package:atc_companion/state/airport.dart';
import 'package:atc_companion/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AirportDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 324.0,
      child: Consumer<AirportState>(
        builder: (context, state, child) {
          return LayoutBuilder(
            builder: (context, constraints) => Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 66,
                  child: HeadingText(
                    'Airport Info',
                  ),
                ),
                Container(
                  height: constraints.maxHeight - 66,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      AirportInfoText('ICAO', state.airport.icao.toUpperCase()),
                      AirportInfoText('Name', state.airport.name),
                      AirportInfoText('City', state.airport.city),
                      AirportInfoText('Country', state.airport.country),
                      AirportInfoText('Elevation', '${state.airport.elevation}ft'),
                      RunwaysText(state.airport.rwys),
                      SizedBox(height: 20),
                      AirportInfoText('METAR', state.airport.weather.sanitized),
                      AirportInfoText('Wind', '${state.airport.weather.windDirection.value}°/${state.airport.weather.windSpeed.value}kts'),
                      AirportInfoText('Visibility', '${state.airport.weather.visibility.value}m'),
                      state.airport.weather.clouds.isNotEmpty
                          ? AirportInfoText('Ceiling', '${(state.airport.weather.clouds.first?.altitude ?? 0) * 100}ft')
                          : Container(),
                      AirportInfoText('Flight Rules', state.airport.weather.flightRules),
                      AirportInfoText('Temperature', '${state.airport.weather.temperature.value}°C'),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
