import 'package:flutter/material.dart';
import 'package:travel_booking_ui/core/utils/formatters.dart';
import 'package:travel_booking_ui/data/models/flight.dart';

class FlightCard extends StatelessWidget {
  const FlightCard({
    super.key,
    required this.flight,
    this.onTap,
  });

  final Flight flight;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    flight.airline,
                    style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      flight.cabinClass,
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                flight.flightNumber,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _FlightPoint(
                      code: flight.from,
                      time: Formatters.time(flight.departure),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          flight.duration,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(child: Divider(color: theme.colorScheme.outlineVariant)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: Icon(
                                Icons.flight,
                                size: 16,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            Expanded(child: Divider(color: theme.colorScheme.outlineVariant)),
                          ],
                        ),
                        Text(
                          flight.stops == 0 ? 'Direct' : '${flight.stops} stop',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: _FlightPoint(
                      code: flight.to,
                      time: Formatters.time(flight.arrival),
                      alignEnd: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Formatters.currency(flight.price),
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  FilledButton.tonal(
                    onPressed: onTap,
                    child: const Text('Select'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FlightPoint extends StatelessWidget {
  const _FlightPoint({
    required this.code,
    required this.time,
    this.alignEnd = false,
  });

  final String code;
  final String time;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          code,
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        Text(
          time,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
