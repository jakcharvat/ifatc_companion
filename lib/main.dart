import 'package:atc_companion/consts.dart';
import 'package:atc_companion/widgets/airport_choice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './state/airport.dart';
import './state/flights.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AirportState(),
      child: ChangeNotifierProvider(
        create: (context) => FlightsState(),
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: primaryColor,
            accentColor: primaryColorDarkest,
            fontFamily: 'futura-pt',
            backgroundColor: backgroundColorLight,
            tooltipTheme: TooltipThemeData(
              decoration: BoxDecoration(
                color: tooltipColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          darkTheme: ThemeData(
            primaryColor: primaryColorLightest,
            accentColor: primaryColorLightest,
            fontFamily: 'futura-pt',
            backgroundColor: backgroundColorDark,
            tooltipTheme: TooltipThemeData(
              decoration: BoxDecoration(
                color: tooltipColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            brightness: Brightness.dark,
          ),
          themeMode: ThemeMode.system,
          home: Scaffolding(),
        ),
      ),
    );
  }
}

class Scaffolding extends StatefulWidget {
  @override
  _ScaffoldingState createState() => _ScaffoldingState();
}

class _ScaffoldingState extends State<Scaffolding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AirportChoice(),
    );
  }
}
