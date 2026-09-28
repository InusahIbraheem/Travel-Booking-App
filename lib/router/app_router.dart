import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_booking_ui/router/routes.dart';
import 'package:travel_booking_ui/screens/auth/login_screen.dart';
import 'package:travel_booking_ui/screens/booking/booking_screen.dart';
import 'package:travel_booking_ui/screens/destinations/destination_details_screen.dart';
import 'package:travel_booking_ui/screens/destinations/popular_destinations_screen.dart';
import 'package:travel_booking_ui/screens/explore/explore_screen.dart';
import 'package:travel_booking_ui/screens/flights/flights_screen.dart';
import 'package:travel_booking_ui/screens/home/home_screen.dart';
import 'package:travel_booking_ui/screens/hotels/hotels_screen.dart';
import 'package:travel_booking_ui/screens/onboarding/onboarding_screen.dart';
import 'package:travel_booking_ui/screens/payment/payment_screen.dart';
import 'package:travel_booking_ui/screens/profile/profile_screen.dart';
import 'package:travel_booking_ui/screens/settings/settings_screen.dart';
import 'package:travel_booking_ui/screens/shell/main_shell.dart';
import 'package:travel_booking_ui/screens/tickets/tickets_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.onboarding,
  routes: [
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => MainShell(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.home,
          pageBuilder: (context, state) => const NoTransitionPage(child: HomeScreen()),
        ),
        GoRoute(
          path: AppRoutes.explore,
          pageBuilder: (context, state) => const NoTransitionPage(child: ExploreScreen()),
        ),
        GoRoute(
          path: AppRoutes.tickets,
          pageBuilder: (context, state) => const NoTransitionPage(child: TicketsScreen()),
        ),
        GoRoute(
          path: AppRoutes.profile,
          pageBuilder: (context, state) => const NoTransitionPage(child: ProfileScreen()),
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.popularDestinations,
      builder: (context, state) => const PopularDestinationsScreen(),
    ),
    GoRoute(
      path: AppRoutes.destinationDetails,
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return DestinationDetailsScreen(destinationId: id);
      },
    ),
    GoRoute(
      path: AppRoutes.booking,
      builder: (context, state) {
        final destinationId = state.uri.queryParameters['destination'];
        return BookingScreen(destinationId: destinationId);
      },
    ),
    GoRoute(
      path: AppRoutes.hotels,
      builder: (context, state) => const HotelsScreen(),
    ),
    GoRoute(
      path: AppRoutes.flights,
      builder: (context, state) => const FlightsScreen(),
    ),
    GoRoute(
      path: AppRoutes.payment,
      builder: (context, state) {
        final amount = double.tryParse(state.uri.queryParameters['amount'] ?? '') ?? 0;
        final title = state.uri.queryParameters['title'] ?? 'Payment';
        return PaymentScreen(amount: amount, title: title);
      },
    ),
    GoRoute(
      path: AppRoutes.settings,
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
