import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_booking_ui/core/utils/responsive.dart';
import 'package:travel_booking_ui/data/mock/mock_data.dart';
import 'package:travel_booking_ui/router/routes.dart';
import 'package:travel_booking_ui/widgets/app_scaffold.dart';
import 'package:travel_booking_ui/widgets/hotel_card.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('Hotels'),
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
              'Handpicked stays for every budget',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 20),
            ...MockData.hotels.map(
              (hotel) => HotelCard(
                hotel: hotel,
                onTap: () => context.push(
                  '${AppRoutes.booking}?destination=${MockData.destinations.first.id}',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
