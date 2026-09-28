import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_booking_ui/core/utils/formatters.dart';
import 'package:travel_booking_ui/core/utils/responsive.dart';
import 'package:travel_booking_ui/data/mock/mock_data.dart';
import 'package:travel_booking_ui/router/routes.dart';
import 'package:travel_booking_ui/widgets/app_scaffold.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = MockData.user;
    final theme = Theme.of(context);

    return AppScaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push(AppRoutes.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: Responsive.pagePadding(context),
        child: Column(
          children: [
            CircleAvatar(
              radius: 52,
              backgroundColor: theme.colorScheme.primaryContainer,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: user.avatarUrl,
                  width: 104,
                  height: 104,
                  fit: BoxFit.cover,
                ),
              ),
            ).animate().scale(duration: 400.ms),
            const SizedBox(height: 16),
            Text(
              user.name,
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              user.email,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Member since ${Formatters.shortDate(user.memberSince)}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    label: 'Trips',
                    value: '${user.tripsCompleted}',
                    icon: Icons.luggage_rounded,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatCard(
                    label: 'Points',
                    value: '${user.loyaltyPoints}',
                    icon: Icons.stars_rounded,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            _ProfileMenuItem(
              icon: Icons.book_online_rounded,
              title: 'My Bookings',
              onTap: () => context.push(AppRoutes.booking),
            ),
            _ProfileMenuItem(
              icon: Icons.confirmation_number_rounded,
              title: 'My Tickets',
              onTap: () => context.go(AppRoutes.tickets),
            ),
            _ProfileMenuItem(
              icon: Icons.flight_rounded,
              title: 'Flights',
              onTap: () => context.push(AppRoutes.flights),
            ),
            _ProfileMenuItem(
              icon: Icons.hotel_rounded,
              title: 'Hotels',
              onTap: () => context.push(AppRoutes.hotels),
            ),
            _ProfileMenuItem(
              icon: Icons.settings_rounded,
              title: 'Settings',
              onTap: () => context.push(AppRoutes.settings),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.label, required this.value, required this.icon});

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: theme.colorScheme.primary),
            const SizedBox(height: 8),
            Text(
              value,
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  const _ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
