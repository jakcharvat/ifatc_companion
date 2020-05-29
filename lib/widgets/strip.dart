import 'dart:ui';

import 'package:flutter/material.dart';

import '../consts.dart';
import '../models/enums.dart';
import '../models/flight.dart';
import '../utils/gradients.dart';
import '../widgets/texts.dart';
import '../models/extensions.dart';

class Strip extends StatelessWidget {
  Strip(this.flight);

  final Flight flight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        height: 66.0,
        decoration: backgroundDecoration,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              LayoutBuilder(
                builder: (context, constraints) => _TimeBox(
                  isEmergency: flight.isEmergency,
                  width: 50.0,
                  height: constraints.maxHeight,
                  child: NormalBoxText(flight.time.toString()),
                ),
              ),
              SizedBox(width: 1.0),
              Column(
                children: <Widget>[
                  Expanded(
                    child: _StripBox(
                      width: 100,
                      child: NormalBoxText(flight.type.typeWeightString),
                    ),
                  ),
                  SizedBox(height: 1.0),
                  Expanded(
                    child: _StripBox(
                      width: 100,
                      child: BoldBoxText(flight.callsign),
                    ),
                  ),
                  SizedBox(height: 1.0),
                  Expanded(
                    child: _StripBox(
                      width: 100,
                      child: NormalBoxText(flight.squawk),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 1.0),
              _StripBox(
                width: 50.0,
                child: NormalBoxText(flight.airportIcao),
              ),
              SizedBox(width: 1.0),
              Column(
                children: <Widget>[
                  Expanded(
                    child: _StripBox(
                      width: 70,
                      child: SmallBoxText(altString),
                    ),
                  ),
                  SizedBox(height: 1.0),
                  Expanded(
                    child: _StripBox(
                      width: 70,
                      child: SmallBoxText(hdgString),
                    ),
                  ),
                  SizedBox(height: 1.0),
                  Expanded(
                    child: _StripBox(
                      width: 70,
                      child: SmallBoxText(iasString),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 1.0),
              Expanded(
                child: _StripBox(
                  child: _StripBox(
                    child: RouteBoxText(flight.fpl.isNotEmpty ? flight.fpl : '---'),
                  ),
                ),
              ),
              SizedBox(width: 1.0),
              _StripBox(
                width: 50.0,
                child: NormalBoxText(flight.rwy),
              ),
            ],
          ),
        ),
      ),
    );
  }

  get altString {
    if (flight.parameters.assignedAlt == null)
      return flight.parameters.currentAlt.toString();

    return '${flight.parameters.currentAlt} '
        '${flight.parameters.currentAlt > flight.parameters.assignedAlt ? ">" : "<"} '
        '${flight.parameters.assignedAlt}';
  }

  get hdgString {
    if (flight.parameters.assignedHdg == null)
      return flight.parameters.currentHdg.toString();

    return '${flight.parameters.currentHdg} '
        '${flight.parameters.currentHdg > flight.parameters.assignedHdg ? "\\" : "/"} '
        '${flight.parameters.assignedHdg}';
  }

  get iasString {
    if (flight.parameters.assignedIas == null)
      return flight.parameters.currentIas.toString();

    return '${flight.parameters.currentIas} '
        '${flight.parameters.currentIas > flight.parameters.assignedIas ? ">" : "<"} '
        '${flight.parameters.assignedIas}';
  }

  get backgroundDecoration {
    if (flight.isEmergency) {
      if (flight.flightDirection == FlightDirection.outbound) return BoxDecoration(
        gradient: Gradients.departureEmergencyGradient,
      );
      else return BoxDecoration(
        gradient: Gradients.arrivalEmergencyGradient,
      );
    }
    if (flight.flightDirection == FlightDirection.outbound) return BoxDecoration(
      color: departureStripColor,
    );
    else return BoxDecoration(
      color: arrivalStripColor,
    );
  }
}

class _StripBox extends StatelessWidget {
  _StripBox({this.child, this.width, this.height});

  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).brightness == Brightness.light
          ? lightBoxColor
          : darkBoxColor,
      width: width,
      height: height,
      child: Center(child: child),
    );
  }
}

class _TimeBox extends StatelessWidget {

  _TimeBox({
    this.isEmergency,
    this.child,
    this.width,
    this.height,
  });

  final bool isEmergency;
  final Widget child;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return isEmergency ? _EmergencyTimeBox(
      child: child,
      height: height,
      width: width,
    ) : _StripBox(
      child: child,
      height: height,
      width: width,
    );
  }
}

class _EmergencyTimeBox extends StatelessWidget {
  _EmergencyTimeBox({this.child, this.width, this.height});

  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: CustomPaint(
        child: Center(child: child),
        painter: _EmergencyTimeBoxPainter(context),
      ),
    );
  }
}

class _EmergencyTimeBoxPainter extends CustomPainter {
  _EmergencyTimeBoxPainter(this.context);

  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Theme.of(context).brightness == Brightness.light
          ? lightBoxColor
          : darkBoxColor;
      
    final path = Path()
      ..moveTo(0, 10)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(24, 0)
      ..lineTo(16, 10)
      ..close();
    
    canvas.drawPath(path, paint);

    final style = TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.light ? lightBoxColor : darkBoxColor
    );
    final span = TextSpan(text: '!', style: style);
    final painter = TextPainter(
      text: span,
      textDirection: TextDirection.ltr
    );
    painter.layout(
      minWidth: 0,
      maxWidth: 10,
    );
    painter.paint(canvas, Offset(8, 0));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

}
