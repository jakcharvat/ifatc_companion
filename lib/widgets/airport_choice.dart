import 'dart:convert';

import 'package:atc_companion/consts.dart';
import 'package:atc_companion/models/enums.dart';
import 'package:atc_companion/state/airport.dart';
import 'package:atc_companion/state/flights.dart';
import 'package:atc_companion/widgets/autocomplete_text_field.dart';
import 'package:atc_companion/widgets/main_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:request_state/request_state.dart';

import '../models/extensions.dart' show HoverEffects;
import 'loading_screen.dart';

class AirportChoice extends StatefulWidget {
  @override
  _AirportChoiceState createState() => _AirportChoiceState();
}

class _AirportChoiceState extends RequestState<AirportChoice> {
  List<String> _icaos;
  Map<String, List<double>> _positions = {};

  @override
  Widget idleBody(BuildContext context) =>
      Center(child: CircularProgressIndicator());

  @override
  Widget receivedResponseBody(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 16.0),
        child: Column(
          children: <Widget>[
            FittedBox(
              child: Text(
                'IFATC Companion',
                style: Theme.of(context).textTheme.headline2.copyWith(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              height: 5.0,
              color: Theme.of(context).accentColor,
            ),
            SizedBox(height: 100.0),
            Text('Which airport will it be today?',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 24.0,
                )),
            SizedBox(height: 50.0),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Select from: ',
                        style: TextStyle(color: Theme.of(context).accentColor)),
                    SizedBox(width: 20.0),
                    Material(
                      color: _icaos.isEmpty ? Theme.of(context).disabledColor : Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(8.0),
                      child: PopupMenuButton<String>(
                        enabled: _icaos.isNotEmpty,
                        elevation: 4.0,
                        itemBuilder: (context) => getAirports(),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Currently active airports',
                            style: TextStyle(color: Theme.of(context).backgroundColor),
                          ),
                        ),
                        offset: Offset(100, -10.0),
                        color: Theme.of(context).accentColor.withOpacity(0.88),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        onSelected: (icao) {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadingScreen()));
                          Provider.of<AirportState>(context, listen: false).getAirport(icao, callback: () {
                            _onAirportGet(context);
                          }, onError: Navigator.of(context).pop);
                        },
                        tooltip: _icaos.isEmpty ? 'No active airports' : 'Click to select',
                      ),
                    ).cursor(_icaos.isEmpty ? CursorType.mouse : CursorType.pointer),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text('Or type an',
                        style: TextStyle(color: Theme.of(context).accentColor)),
                    SizedBox(width: 20.0),
                    Container(
                      width: 200,
                      child: AutocompleteTextField(),
                    ).cursor(CursorType.pointer)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget waitingForResponseBody(BuildContext context) => idleBody(context);

  @override
  void initState() {
    super.initState();

    Provider.of<AirportState>(context, listen: false).getIcaos();

    sendRequest(URLs.IF_ACTIVE_FACILITIES_URL, onReceived: (response) {
      final json = jsonDecode(response.data) as List;
      _icaos = Set.from(json.map((airport) => airport['Name']))
          .cast<String>()
          .toList();

      json.forEach((element) {
        _positions[element['Name']] = [ element["Latitude"], element["Longitude"] ];
      });
    });
  }


  List<PopupMenuEntry> getAirports() {
    return _icaos.map((String icao) => PopupMenuItem<String>(
          child: Text(icao,
              style: TextStyle(
                color: Theme.of(context).backgroundColor,
              )),
          value: icao == 'Active Airports' ? null : icao,
        )).toList();
  }


  void _onAirportGet(BuildContext context) async {
    final airport = Provider.of<AirportState>(context, listen: false).airport;
    final position = _positions[airport.icao];
    await Provider.of<FlightsState>(context, listen: false).getFlights(airport.icao, position);

    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => MainDisplay(),
    ));
  }
}
