import 'package:atc_companion/models/enums.dart';
import 'package:atc_companion/widgets/aircraft_list.dart';
import 'package:flutter/material.dart' hide CloseButton;

import 'separator.dart';
import 'airport_detail.dart';
import 'close_button.dart';

class MainDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                AircraftList(FlightDirection.inbound),
                Separator(),
                AircraftList(FlightDirection.outbound),
                Separator(),
                AirportDetail(),
              ],
            ),
          ),
          CloseButton()
        ],
      ),
    );
  }
}