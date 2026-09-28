import 'package:flutter/material.dart';
import 'package:travel_booking_ui/core/constants/app_constants.dart';
import 'package:travel_booking_ui/core/theme/app_theme.dart';
import 'package:travel_booking_ui/router/app_router.dart';

class TravelBookingApp extends StatelessWidget {
  const TravelBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: appRouter,
    );
  }
}
