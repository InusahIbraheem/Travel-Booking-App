import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:travel_booking_ui/core/theme/app_theme.dart';
import 'package:travel_booking_ui/screens/onboarding/onboarding_screen.dart';
import 'package:travel_booking_ui/screens/auth/login_screen.dart';
import 'package:travel_booking_ui/screens/home/home_screen.dart';
import 'package:travel_booking_ui/screens/explore/explore_screen.dart';
import 'package:travel_booking_ui/screens/destinations/popular_destinations_screen.dart';
import 'package:travel_booking_ui/screens/destinations/destination_details_screen.dart';
import 'package:travel_booking_ui/screens/flights/flights_screen.dart';
import 'package:travel_booking_ui/screens/hotels/hotels_screen.dart';
import 'package:travel_booking_ui/screens/tickets/tickets_screen.dart';
import 'package:travel_booking_ui/screens/booking/booking_screen.dart';
import 'package:travel_booking_ui/screens/payment/payment_screen.dart';
import 'package:travel_booking_ui/screens/profile/profile_screen.dart';
import 'package:travel_booking_ui/screens/settings/settings_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  testWidgets('Generate high-res screenshots for Travel Booking UI App', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;

    final screens = <String, Widget>{
      '01_onboarding': const OnboardingScreen(),
      '02_login': const LoginScreen(),
      '03_home': const HomeScreen(),
      '04_explore': const ExploreScreen(),
      '05_popular_destinations': const PopularDestinationsScreen(),
      '06_destination_details': const DestinationDetailsScreen(destinationId: '1'),
      '07_flights': const FlightsScreen(),
      '08_hotels': const HotelsScreen(),
      '09_tickets': const TicketsScreen(),
      '10_booking': const BookingScreen(destinationId: '1'),
      '11_payment': const PaymentScreen(amount: 450.0, title: 'Bali Luxury Trip'),
      '12_profile': const ProfileScreen(),
      '13_settings': const SettingsScreen(),
    };

    final dir = Directory('screenshots');
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }

    for (final entry in screens.entries) {
      final repaintBoundaryKey = GlobalKey();
      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          home: RepaintBoundary(
            key: repaintBoundaryKey,
            child: entry.value,
          ),
        ),
      );

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      final boundary = repaintBoundaryKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary != null) {
        await tester.runAsync(() async {
          final image = await boundary.toImage(pixelRatio: 2.0);
          final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
          if (byteData != null) {
            final pngBytes = byteData.buffer.asUint8List();
            final file = File('screenshots/${entry.key}.png');
            await file.writeAsBytes(pngBytes);
            // ignore: avoid_print
            print('Saved screenshot: screenshots/${entry.key}.png (${pngBytes.length} bytes)');
          }
        });
      }
    }
  });
}
