import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_booking_ui/core/utils/formatters.dart';
import 'package:travel_booking_ui/core/utils/responsive.dart';
import 'package:travel_booking_ui/data/mock/mock_data.dart';
import 'package:travel_booking_ui/router/routes.dart';
import 'package:travel_booking_ui/widgets/app_scaffold.dart';
import 'package:travel_booking_ui/widgets/flight_card.dart';

class FlightsScreen extends StatelessWidget {
  const FlightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('Flights'),
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
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.flight_takeoff_rounded),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Accra (ACC)', style: TextStyle(fontWeight: FontWeight.w700)),
                          Text(
                            'Jul 2026 · 1 passenger · Economy',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.swap_horiz_rounded),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${MockData.flights.length} flights available',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            ...MockData.flights.map(
              (flight) => FlightCard(
                flight: flight,
                onTap: () => context.push(
                  '${AppRoutes.payment}?amount=${flight.price}&title=${Uri.encodeComponent(flight.airline)}',
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Prices from ${Formatters.currency(MockData.flights.map((f) => f.price).reduce((a, b) => a < b ? a : b))}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
