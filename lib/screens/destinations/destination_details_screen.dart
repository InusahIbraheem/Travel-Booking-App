import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_booking_ui/core/utils/formatters.dart';
import 'package:travel_booking_ui/core/utils/responsive.dart';
import 'package:travel_booking_ui/data/mock/mock_data.dart';
import 'package:travel_booking_ui/router/routes.dart';
import 'package:travel_booking_ui/widgets/app_scaffold.dart';

class DestinationDetailsScreen extends StatelessWidget {
  const DestinationDetailsScreen({super.key, required this.destinationId});

  final String destinationId;

  @override
  Widget build(BuildContext context) {
    final destination = MockData.destinationById(destinationId);
    final theme = Theme.of(context);

    if (destination == null) {
      return AppScaffold(
        appBar: AppBar(title: const Text('Not Found')),
        body: const Center(child: Text('Destination not found')),
      );
    }

    return AppScaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () => context.pop(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: destination.imageUrl,
              height: 280,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: Responsive.pagePadding(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          destination.locationLabel,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star_rounded, size: 18, color: Colors.amber.shade700),
                            const SizedBox(width: 4),
                            Text(
                              '${destination.rating} (${destination.reviewCount})',
                              style: theme.textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).animate().fadeIn(),
                  const SizedBox(height: 8),
                  Text(
                    destination.category,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    destination.description,
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Highlights',
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: destination.highlights
                        .map(
                          (h) => Chip(
                            avatar: Icon(Icons.check_circle,
                                size: 18, color: theme.colorScheme.primary),
                            label: Text(h),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Text(
                        Formatters.currency(destination.pricePerNight),
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        ' / night',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: () => context.push(
                      '${AppRoutes.booking}?destination=${destination.id}',
                    ),
                    child: const Text('Book Now'),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () => context.push(AppRoutes.hotels),
                    child: const Text('View Hotels'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
