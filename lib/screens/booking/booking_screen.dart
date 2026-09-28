import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_booking_ui/core/utils/formatters.dart';
import 'package:travel_booking_ui/core/utils/responsive.dart';
import 'package:travel_booking_ui/data/mock/mock_data.dart';
import 'package:travel_booking_ui/data/models/booking.dart';
import 'package:travel_booking_ui/data/models/destination.dart';
import 'package:travel_booking_ui/router/routes.dart';
import 'package:travel_booking_ui/widgets/app_scaffold.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key, this.destinationId});

  final String? destinationId;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late Destination? _destination;
  DateTime _checkIn = DateTime(2026, 8, 1);
  DateTime _checkOut = DateTime(2026, 8, 7);
  int _guests = 2;

  @override
  void initState() {
    super.initState();
    _destination = widget.destinationId != null
        ? MockData.destinationById(widget.destinationId!)
        : MockData.destinations.first;
  }

  double get _totalPrice {
    if (_destination == null) return 0;
    final nights = _checkOut.difference(_checkIn).inDays.clamp(1, 365);
    return _destination!.pricePerNight * nights * _guests;
  }

  Future<void> _pickDate({required bool isCheckIn}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isCheckIn ? _checkIn : _checkOut,
      firstDate: DateTime.now(),
      lastDate: DateTime(2027, 12, 31),
    );
    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          _checkIn = picked;
          if (!_checkOut.isAfter(_checkIn)) {
            _checkOut = _checkIn.add(const Duration(days: 1));
          }
        } else {
          _checkOut = picked;
        }
      });
    }
  }

  void _confirmBooking() {
    context.push(
      '${AppRoutes.payment}?amount=$_totalPrice&title=${Uri.encodeComponent(_destination?.name ?? 'Booking')}',
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold(
      appBar: AppBar(
        title: const Text('Book Your Trip'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: Responsive.pagePadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_destination != null) ...[
              Card(
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      _destination!.imageUrl,
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(_destination!.locationLabel),
                  subtitle: Text(
                    '${Formatters.currency(_destination!.pricePerNight)}/night',
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
            Text(
              'Select destination',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _destination?.id,
              decoration: const InputDecoration(prefixIcon: Icon(Icons.place_outlined)),
              items: MockData.destinations
                  .map(
                    (d) => DropdownMenuItem(value: d.id, child: Text(d.locationLabel)),
                  )
                  .toList(),
              onChanged: (id) {
                if (id != null) {
                  setState(() => _destination = MockData.destinationById(id));
                }
              },
            ),
            const SizedBox(height: 20),
            _DateTile(
              label: 'Check-in',
              date: _checkIn,
              onTap: () => _pickDate(isCheckIn: true),
            ),
            const SizedBox(height: 12),
            _DateTile(
              label: 'Check-out',
              date: _checkOut,
              onTap: () => _pickDate(isCheckIn: false),
            ),
            const SizedBox(height: 20),
            Text(
              'Guests',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton.filledTonal(
                  onPressed: _guests > 1 ? () => setState(() => _guests--) : null,
                  icon: const Icon(Icons.remove),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text('$_guests', style: theme.textTheme.headlineSmall),
                ),
                IconButton.filledTonal(
                  onPressed: _guests < 8 ? () => setState(() => _guests++) : null,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 28),
            const Text('Your bookings', style: TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            ...MockData.bookings.map((b) => _BookingListTile(booking: b)),
            const SizedBox(height: 24),
            Card(
              color: theme.colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total', style: theme.textTheme.titleMedium),
                    Text(
                      Formatters.currency(_totalPrice),
                      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _confirmBooking,
              child: const Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DateTile extends StatelessWidget {
  const _DateTile({required this.label, required this.date, required this.onTap});

  final String label;
  final DateTime date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      leading: const Icon(Icons.calendar_month_outlined),
      title: Text(label),
      trailing: Text(Formatters.shortDate(date), style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}

class _BookingListTile extends StatelessWidget {
  const _BookingListTile({required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(booking.destinationName),
        subtitle: Text(
          '${Formatters.dayMonth(booking.checkIn)} – ${Formatters.dayMonth(booking.checkOut)} · ${booking.status}',
        ),
        trailing: Text(Formatters.currency(booking.totalPrice)),
      ),
    );
  }
}
