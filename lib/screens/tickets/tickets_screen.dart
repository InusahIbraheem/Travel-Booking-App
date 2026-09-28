import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:travel_booking_ui/core/utils/formatters.dart';
import 'package:travel_booking_ui/core/utils/responsive.dart';
import 'package:travel_booking_ui/data/mock/mock_data.dart';
import 'package:travel_booking_ui/data/models/ticket.dart';
import 'package:travel_booking_ui/widgets/app_scaffold.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: const Text('My Tickets')),
      body: SingleChildScrollView(
        padding: Responsive.pagePadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your travel documents',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 20),
            ...MockData.tickets.asMap().entries.map(
              (entry) => _TicketCard(ticket: entry.value, index: entry.key),
            ),
          ],
        ),
      ),
    );
  }
}

class _TicketCard extends StatelessWidget {
  const _TicketCard({required this.ticket, required this.index});

  final Ticket ticket;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isFlight = ticket.type == 'Flight';

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: theme.colorScheme.primary,
            child: Row(
              children: [
                Icon(
                  isFlight ? Icons.flight_rounded : Icons.hotel_rounded,
                  color: Colors.white,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticket.title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        ticket.subtitle,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white.withValues(alpha: 0.85),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    ticket.type,
                    style: theme.textTheme.labelSmall?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _InfoRow(label: 'Date', value: Formatters.shortDate(ticket.date)),
                      const SizedBox(height: 8),
                      _InfoRow(label: isFlight ? 'Seat' : 'Room', value: ticket.seatOrRoom),
                      const SizedBox(height: 8),
                      _InfoRow(label: 'Confirmation', value: ticket.confirmationCode),
                    ],
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: theme.colorScheme.outlineVariant),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.qr_code_2_rounded, size: 64, color: theme.colorScheme.onSurface),
                ),
              ],
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(delay: (index * 100).ms)
        .slideY(begin: 0.05, end: 0);
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        Text(value, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
