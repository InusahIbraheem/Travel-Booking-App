class Flight {
  const Flight({
    required this.id,
    required this.airline,
    required this.flightNumber,
    required this.from,
    required this.to,
    required this.departure,
    required this.arrival,
    required this.duration,
    required this.price,
    required this.stops,
    required this.cabinClass,
  });

  final String id;
  final String airline;
  final String flightNumber;
  final String from;
  final String to;
  final DateTime departure;
  final DateTime arrival;
  final String duration;
  final double price;
  final int stops;
  final String cabinClass;
}
