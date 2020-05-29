import 'dart:math';

class Angle {
  const Angle(this._rad);
  factory Angle.fromDegrees(int deg) => Angle(deg / 180 * pi);

  final double _rad;

  double get radians => _rad;
  double get degrees => _rad / pi * 180;
}