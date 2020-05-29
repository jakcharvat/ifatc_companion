import 'package:atc_companion/utils/radians.dart';
import 'package:flutter/rendering.dart';

class Gradients {
  static final arrivalEmergencyGradient = LinearGradient(
    colors: [
      Color(0xFFFF5656),
      Color(0xFFFFA144),
    ],
    stops: [0, 0.52],
    transform: GradientRotation(Angle.fromDegrees(136).radians),
  );

  static final departureEmergencyGradient = LinearGradient(
    colors: [
      Color(0xFFFF5656),
      Color(0xFF5A44FF),
    ],
    stops: [0, 0.53],
    transform: GradientRotation(Angle.fromDegrees(136).radians),
  );
}