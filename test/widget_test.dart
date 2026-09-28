import 'package:flutter_test/flutter_test.dart';
import 'package:travel_booking_ui/app.dart';

void main() {
  testWidgets('App loads onboarding screen', (WidgetTester tester) async {
    await tester.pumpWidget(const TravelBookingApp());
    await tester.pumpAndSettle();

    expect(find.text('Discover the World'), findsOneWidget);
    expect(find.text('Developed by @inusah_ibraheem'), findsOneWidget);
  });
}
