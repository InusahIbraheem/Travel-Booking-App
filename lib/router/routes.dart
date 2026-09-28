class AppRoutes {
  AppRoutes._();

  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String home = '/';
  static const String explore = '/explore';
  static const String popularDestinations = '/popular-destinations';
  static const String destinationDetails = '/destination/:id';
  static const String booking = '/booking';
  static const String hotels = '/hotels';
  static const String flights = '/flights';
  static const String payment = '/payment';
  static const String tickets = '/tickets';
  static const String profile = '/profile';
  static const String settings = '/settings';

  static String destinationDetailsPath(String id) => '/destination/$id';
}
