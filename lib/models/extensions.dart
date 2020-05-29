import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/widgets.dart';

import 'dart:html' as html;

import 'enums.dart';

extension qwerty on AircraftType {
  static const lights = [
    AircraftType.c172,
  ];
  static const mediums = [
    AircraftType.a318,
    AircraftType.a319,
    AircraftType.a320,
    AircraftType.a321,
    AircraftType.b712,
    AircraftType.b737,
    AircraftType.b738,
    AircraftType.b739,
    AircraftType.b752,
  ];
  static const heavies = [
    AircraftType.a332,
    AircraftType.a333,
    AircraftType.a346,
    AircraftType.a359,
    AircraftType.b744,
    AircraftType.b748,
    AircraftType.b763,
    AircraftType.b772,
    AircraftType.b77w,
    AircraftType.b788,
    AircraftType.b789,
    AircraftType.b78x
  ];
  static const supers = [
    AircraftType.a388,
  ];

  WeightCategory get weightCategory {
    if (supers.contains(this)) return WeightCategory.J;
    if (lights.contains(this)) return WeightCategory.L;
    if (heavies.contains(this)) return WeightCategory.H;
    return WeightCategory.M;
  }

  String get typeWeightString =>
      '${EnumToString.parse(this).toUpperCase()} / ${EnumToString.parse(weightCategory).toUpperCase()}';
}

extension on WeightCategory {
  String get categoryString {
    switch (this) {
      case WeightCategory.L:
        return 'light';
      case WeightCategory.M:
        return 'medium';
      case WeightCategory.H:
        return 'heavy';
      case WeightCategory.J:
        return 'super';
      default:
        return '';
    }
  }
}

extension on CursorType {
  String get cssString => {
    CursorType.mouse: 'default',
    CursorType.pointer: 'pointer',
    CursorType.text: 'text',
  }[this];
}

extension HoverEffects on Widget {
  static final appContainer = html.window.document.getElementById('appContainer');

  Widget cursor([CursorType type = CursorType.pointer]) => MouseRegion(
    child: this,
    onHover: (_) => appContainer.style.cursor = type.cssString,
    onExit: (_) => appContainer.style.cursor = CursorType.mouse.cssString,
  );
}

