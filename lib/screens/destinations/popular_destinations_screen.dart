import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_booking_ui/core/utils/responsive.dart';
import 'package:travel_booking_ui/data/mock/mock_data.dart';
import 'package:travel_booking_ui/router/routes.dart';
import 'package:travel_booking_ui/widgets/app_scaffold.dart';
import 'package:travel_booking_ui/widgets/destination_card.dart';

class PopularDestinationsScreen extends StatelessWidget {
  const PopularDestinationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final destinations = MockData.popularDestinations();

    return AppScaffold(
      appBar: AppBar(
        title: const Text('Popular Destinations'),
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
            Text(
              'Trending places travelers love',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.gridCrossAxisCount(context),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.72,
              ),
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                final destination = destinations[index];
                return DestinationCard(
                  destination: destination,
                  onTap: () => context.push(
                    AppRoutes.destinationDetailsPath(destination.id),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
