class Booking {
  const Booking({
    required this.id,
    required this.destinationName,
    required this.imageUrl,
    required this.checkIn,
    required this.checkOut,
    required this.guests,
    required this.totalPrice,
    required this.status,
  });

  final String id;
  final String destinationName;
  final String imageUrl;
  final DateTime checkIn;
  final DateTime checkOut;
  final int guests;
  final double totalPrice;
  final String status;
}
