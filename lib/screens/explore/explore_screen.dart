import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_booking_ui/core/utils/responsive.dart';
import 'package:travel_booking_ui/data/mock/mock_data.dart';
import 'package:travel_booking_ui/router/routes.dart';
import 'package:travel_booking_ui/widgets/app_scaffold.dart';
import 'package:travel_booking_ui/widgets/destination_card.dart';
import 'package:travel_booking_ui/widgets/travel_search_bar.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String _selectedCategory = 'All';
  String _searchQuery = '';

  List<dynamic> get _filteredDestinations {
    return MockData.destinations.where((d) {
      final matchesCategory =
          _selectedCategory == 'All' || d.category == _selectedCategory;
      final matchesSearch = _searchQuery.isEmpty ||
          d.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          d.country.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final destinations = _filteredDestinations;

    return AppScaffold(
      appBar: AppBar(title: const Text('Explore')),
      body: SingleChildScrollView(
        padding: Responsive.pagePadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TravelSearchBar(
              readOnly: false,
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: MockData.categories.length,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final category = MockData.categories[index];
                  final selected = category == _selectedCategory;
                  return FilterChip(
                    label: Text(category),
                    selected: selected,
                    onSelected: (_) => setState(() => _selectedCategory = category),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${destinations.length} destinations found',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 16),
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
