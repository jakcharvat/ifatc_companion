class FlightParameters {
  const FlightParameters({
    this.currentHdg,
    this.assignedHdg,
    this.currentIas,
    this.assignedIas,
    this.currentAlt,
    this.assignedAlt,
  });

  final int currentHdg,
    assignedHdg,
    currentIas,
    assignedIas;
  final Altitude currentAlt,
    assignedAlt;
}

class Altitude {
  const Altitude(this.ft);

  final int ft;

  operator >(Altitude other) => this.ft > other.ft;

  @override
  String toString() => '${(ft / 100).floor()}';
}

class Heading {
  const Heading(this.deg);

  final int deg;

  operator >(Heading other) {
    int diff = other.deg - this.deg;
    if (diff > 180) diff = -diff;
    return diff > 0;
  }

  String toString() => '$deg°';
}
