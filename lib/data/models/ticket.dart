class Ticket {
  const Ticket({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.seatOrRoom,
    required this.confirmationCode,
    required this.qrData,
    required this.type,
  });

  final String id;
  final String title;
  final String subtitle;
  final DateTime date;
  final String seatOrRoom;
  final String confirmationCode;
  final String qrData;
  final String type;
}
