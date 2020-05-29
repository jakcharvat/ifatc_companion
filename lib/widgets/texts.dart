import 'package:atc_companion/models/avwx_responses/runway.dart';
import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  HeadingText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 50.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class NormalBoxText extends StatelessWidget {
  NormalBoxText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: TextStyle(
        fontSize: 14.0,
      ),
    );
  }
}

class BoldBoxText extends StatelessWidget {
  BoldBoxText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class SmallBoxText extends StatelessWidget {
  SmallBoxText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: TextStyle(
        fontSize: 11.0,
      ),
    );
  }
}

class RouteBoxText extends StatelessWidget {
  RouteBoxText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14.0,
            height: 20/14,
          ),
        ),
      ),
    );
  }
}

class AirportInfoText extends StatelessWidget {
  AirportInfoText(this.normal, this.bold);

  final String normal, bold;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: '$normal: ',
            ),
            TextSpan(
              text: bold,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'futura-pt',
                fontSize: 16.0,
              ),
            )
          ],
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color,
            fontFamily: 'futura-pt',
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

class RunwaysText extends StatelessWidget {

  RunwaysText(this.rwys);

  final List<Runway> rwys;
  final style = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'futura-pt',
    fontSize: 16.0,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Runways: ', style: style.copyWith(fontWeight: FontWeight.w700)),
        ]..addAll(_buildRunways().map((e) => Padding(padding: EdgeInsets.only(left: 12.0), child: e))),
      ),
    );
  }

  List<Widget> _buildRunways() {
    
    final labels = Column(
      children: rwys.map((e) => Text(
        '${e.end1} / ${e.end2}',
        style: style,
      )).toList(),
    );

    final lengths = Column(
      children: rwys.map((e) => Text(
        '${e.length}ft',
        style: style,
      )).toList(),
    );

    final xs = Column(
      children: rwys.map((_) => Text(
        'x',
        style: style,
      )).toList(),
    );

    final widths = Column(
      children: rwys.map((e) => Text(
        '${e.width}ft',
        style: style,
      )).toList()
    );

    return [labels, lengths, xs, widths];
  }
}
