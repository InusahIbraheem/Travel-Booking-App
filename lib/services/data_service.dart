import 'package:travel_booking_ui/models/app_item.dart';

class DataService {
  static List<AppItem> get items => List.generate(8, (i) => AppItem(
        id: 'item_$i',
        title: 'Premium Item ${i + 1}',
        subtitle: 'Curated content for Travel Booking UI',
        imageUrl: 'https://picsum.photos/seed/travel_booking_ui$i/400/300',
      ));
}
