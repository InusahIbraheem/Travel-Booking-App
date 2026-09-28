import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_booking_ui/core/constants/app_constants.dart';
import 'package:travel_booking_ui/core/utils/responsive.dart';
import 'package:travel_booking_ui/data/mock/mock_data.dart';
import 'package:travel_booking_ui/router/routes.dart';
import 'package:travel_booking_ui/widgets/app_scaffold.dart';
import 'package:travel_booking_ui/widgets/destination_card.dart';
import 'package:travel_booking_ui/widgets/section_header.dart';
import 'package:travel_booking_ui/widgets/travel_search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final popular = MockData.popularDestinations().take(4).toList();

    return AppScaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${MockData.user.name.split(' ').first}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            Text(AppConstants.appName),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: Responsive.pagePadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Where to next?',
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
            ).animate().fadeIn(),
            const SizedBox(height: 16),
            TravelSearchBar(
              onTap: () => context.push(AppRoutes.explore),
            ).animate().fadeIn(delay: 100.ms),
            const SizedBox(height: 24),
            _QuickActionsRow(),
            const SizedBox(height: 28),
            SectionHeader(
              title: 'Popular Destinations',
              actionLabel: 'See all',
              onAction: () => context.push(AppRoutes.popularDestinations),
            ),
            SizedBox(
              height: 240,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: popular.length,
                separatorBuilder: (_, _) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final destination = popular[index];
                  return SizedBox(
                    width: Responsive.isMobile(context) ? 180 : 220,
                    child: DestinationCard(
                      destination: destination,
                      onTap: () => context.push(
                        AppRoutes.destinationDetailsPath(destination.id),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 28),
            SectionHeader(
              title: 'Upcoming Trips',
              actionLabel: 'My bookings',
              onAction: () => context.push(AppRoutes.booking),
            ),
            ...MockData.bookings.map(
              (booking) => _UpcomingTripCard(booking: booking),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickActionsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final actions = [
      _QuickAction(Icons.flight_rounded, 'Flights', AppRoutes.flights),
      _QuickAction(Icons.hotel_rounded, 'Hotels', AppRoutes.hotels),
      _QuickAction(Icons.map_rounded, 'Explore', AppRoutes.explore),
      _QuickAction(Icons.book_online_rounded, 'Book', AppRoutes.booking),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: actions
          .map(
            (action) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: InkWell(
                  onTap: () => context.push(action.route),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(action.icon, color: Theme.of(context).colorScheme.primary),
                        const SizedBox(height: 8),
                        Text(
                          action.label,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    ).animate().fadeIn(delay: 200.ms);
  }
}

class _QuickAction {
  const _QuickAction(this.icon, this.label, this.route);

  final IconData icon;
  final String label;
  final String route;
}

class _UpcomingTripCard extends StatelessWidget {
  const _UpcomingTripCard({required this.booking});

  final dynamic booking;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(booking.imageUrl, width: 56, height: 56, fit: BoxFit.cover),
        ),
        title: Text(booking.destinationName, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('${booking.guests} guests · ${booking.status}'),
        trailing: Icon(Icons.chevron_right, color: theme.colorScheme.primary),
        onTap: () => context.push(AppRoutes.tickets),
      ),
    );
  }
}
