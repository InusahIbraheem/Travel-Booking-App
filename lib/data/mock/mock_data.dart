import 'package:travel_booking_ui/core/constants/app_constants.dart';
import 'package:travel_booking_ui/data/models/booking.dart';
import 'package:travel_booking_ui/data/models/destination.dart';
import 'package:travel_booking_ui/data/models/flight.dart';
import 'package:travel_booking_ui/data/models/hotel.dart';
import 'package:travel_booking_ui/data/models/ticket.dart';
import 'package:travel_booking_ui/data/models/user_profile.dart';

class MockData {
  MockData._();

  static final UserProfile user = UserProfile(
    name: AppConstants.defaultUserName,
    email: AppConstants.defaultUserEmail,
    avatarUrl:
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&h=200&fit=crop',
    memberSince: DateTime(2022, 3, 15),
    tripsCompleted: 24,
    loyaltyPoints: 4850,
  );

  static const List<Destination> destinations = [
    Destination(
      id: 'bali',
      name: 'Bali',
      country: 'Indonesia',
      imageUrl:
          'https://images.unsplash.com/photo-1537996194471-d05706f791d0?w=800&h=600&fit=crop',
      rating: 4.8,
      reviewCount: 2847,
      pricePerNight: 189,
      description:
          'Discover lush rice terraces, sacred temples, and pristine beaches on the Island of the Gods. Bali blends spiritual culture with world-class resorts and vibrant nightlife in Seminyak and Ubud.',
      highlights: ['Ubud Rice Terraces', 'Tanah Lot Temple', 'Nusa Penida', 'Seminyak Beach'],
      category: 'Beach',
      isPopular: true,
    ),
    Destination(
      id: 'paris',
      name: 'Paris',
      country: 'France',
      imageUrl:
          'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800&h=600&fit=crop',
      rating: 4.9,
      reviewCount: 5120,
      pricePerNight: 245,
      description:
          'The City of Light enchants with iconic landmarks, Michelin-starred dining, and charming boulevards. Stroll along the Seine, explore world-class museums, and savor café culture.',
      highlights: ['Eiffel Tower', 'Louvre Museum', 'Montmartre', 'Seine River Cruise'],
      category: 'City',
      isPopular: true,
    ),
    Destination(
      id: 'santorini',
      name: 'Santorini',
      country: 'Greece',
      imageUrl:
          'https://images.unsplash.com/photo-1613395877344-13d4a8e0d49e?w=800&h=600&fit=crop',
      rating: 4.9,
      reviewCount: 3912,
      pricePerNight: 320,
      description:
          'Whitewashed villages cling to volcanic cliffs above the Aegean Sea. Santorini is famous for dramatic sunsets, boutique cave hotels, and fresh Mediterranean cuisine.',
      highlights: ['Oia Sunset', 'Red Beach', 'Wine Tasting', 'Caldera Views'],
      category: 'Island',
      isPopular: true,
    ),
    Destination(
      id: 'tokyo',
      name: 'Tokyo',
      country: 'Japan',
      imageUrl:
          'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=800&h=600&fit=crop',
      rating: 4.7,
      reviewCount: 4280,
      pricePerNight: 210,
      description:
          'A dazzling fusion of tradition and futurism. From serene shrines and cherry blossoms to neon-lit districts and exceptional sushi, Tokyo offers endless discovery.',
      highlights: ['Shibuya Crossing', 'Senso-ji Temple', 'Tsukiji Market', 'TeamLab Planets'],
      category: 'City',
      isPopular: true,
    ),
    Destination(
      id: 'dubai',
      name: 'Dubai',
      country: 'UAE',
      imageUrl:
          'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800&h=600&fit=crop',
      rating: 4.6,
      reviewCount: 3560,
      pricePerNight: 275,
      description:
          'Experience luxury redefined in the desert metropolis. Dubai boasts record-breaking architecture, golden beaches, desert safaris, and unparalleled shopping.',
      highlights: ['Burj Khalifa', 'Desert Safari', 'Palm Jumeirah', 'Dubai Mall'],
      category: 'Luxury',
      isPopular: true,
    ),
    Destination(
      id: 'maldives',
      name: 'Maldives',
      country: 'Maldives',
      imageUrl:
          'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=800&h=600&fit=crop',
      rating: 4.9,
      reviewCount: 2180,
      pricePerNight: 450,
      description:
          'Overwater villas, crystal-clear lagoons, and vibrant coral reefs make the Maldives the ultimate tropical escape for honeymooners and divers alike.',
      highlights: ['Overwater Bungalows', 'Snorkeling', 'Sunset Cruise', 'Spa Retreats'],
      category: 'Beach',
      isPopular: true,
    ),
    Destination(
      id: 'new-york',
      name: 'New York',
      country: 'USA',
      imageUrl:
          'https://images.unsplash.com/photo-1496442226666-8d0d0e62e569?w=800&h=600&fit=crop',
      rating: 4.7,
      reviewCount: 6720,
      pricePerNight: 295,
      description:
          'The city that never sleeps pulses with Broadway shows, iconic skylines, diverse neighborhoods, and culinary excellence from street food to fine dining.',
      highlights: ['Central Park', 'Statue of Liberty', 'Times Square', 'Brooklyn Bridge'],
      category: 'City',
      isPopular: false,
    ),
    Destination(
      id: 'cape-town',
      name: 'Cape Town',
      country: 'South Africa',
      imageUrl:
          'https://images.unsplash.com/photo-1580060839134-75a3edada2e9?w=800&h=600&fit=crop',
      rating: 4.8,
      reviewCount: 1940,
      pricePerNight: 165,
      description:
          'Nestled beneath Table Mountain, Cape Town offers stunning coastlines, award-winning wineries, penguin colonies, and a rich cultural heritage.',
      highlights: ['Table Mountain', 'Cape Point', 'V&A Waterfront', 'Stellenbosch Wineries'],
      category: 'Adventure',
      isPopular: false,
    ),
  ];

  static final List<Hotel> hotels = [
    Hotel(
      id: 'h1',
      name: 'The Ubud Jungle Retreat',
      location: 'Ubud, Bali',
      imageUrl:
          'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&h=600&fit=crop',
      rating: 4.8,
      pricePerNight: 189,
      amenities: ['Pool', 'Spa', 'Free WiFi', 'Breakfast'],
      stars: 5,
    ),
    Hotel(
      id: 'h2',
      name: 'Le Marais Boutique Hotel',
      location: 'Paris, France',
      imageUrl:
          'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&h=600&fit=crop',
      rating: 4.7,
      pricePerNight: 245,
      amenities: ['Concierge', 'Bar', 'Room Service', 'Gym'],
      stars: 4,
    ),
    Hotel(
      id: 'h3',
      name: 'Caldera View Suites',
      location: 'Oia, Santorini',
      imageUrl:
          'https://images.unsplash.com/photo-1520250497591-112f2a40a3f4?w=800&h=600&fit=crop',
      rating: 4.9,
      pricePerNight: 380,
      amenities: ['Infinity Pool', 'Sunset Terrace', 'Spa', 'Airport Shuttle'],
      stars: 5,
    ),
    Hotel(
      id: 'h4',
      name: 'Shinjuku Sky Tower Hotel',
      location: 'Tokyo, Japan',
      imageUrl:
          'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=800&h=600&fit=crop',
      rating: 4.6,
      pricePerNight: 210,
      amenities: ['City View', 'Onsen', 'Restaurant', 'Laundry'],
      stars: 4,
    ),
    Hotel(
      id: 'h5',
      name: 'Palm Atlantis Resort',
      location: 'Dubai, UAE',
      imageUrl:
          'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&h=600&fit=crop',
      rating: 4.8,
      pricePerNight: 420,
      amenities: ['Waterpark', 'Private Beach', 'Kids Club', 'Spa'],
      stars: 5,
    ),
  ];

  static final List<Flight> flights = [
    Flight(
      id: 'f1',
      airline: 'Emirates',
      flightNumber: 'EK 205',
      from: 'ACC',
      to: 'DXB',
      departure: DateTime(2026, 7, 12, 8, 30),
      arrival: DateTime(2026, 7, 12, 20, 45),
      duration: '8h 15m',
      price: 892,
      stops: 0,
      cabinClass: 'Economy',
    ),
    Flight(
      id: 'f2',
      airline: 'Air France',
      flightNumber: 'AF 842',
      from: 'ACC',
      to: 'CDG',
      departure: DateTime(2026, 7, 15, 22, 10),
      arrival: DateTime(2026, 7, 16, 6, 55),
      duration: '6h 45m',
      price: 745,
      stops: 0,
      cabinClass: 'Premium Economy',
    ),
    Flight(
      id: 'f3',
      airline: 'Singapore Airlines',
      flightNumber: 'SQ 305',
      from: 'ACC',
      to: 'SIN',
      departure: DateTime(2026, 7, 18, 14, 0),
      arrival: DateTime(2026, 7, 19, 8, 30),
      duration: '14h 30m',
      price: 1120,
      stops: 1,
      cabinClass: 'Business',
    ),
    Flight(
      id: 'f4',
      airline: 'Qatar Airways',
      flightNumber: 'QR 1372',
      from: 'ACC',
      to: 'NRT',
      departure: DateTime(2026, 7, 20, 1, 45),
      arrival: DateTime(2026, 7, 20, 22, 10),
      duration: '16h 25m',
      price: 980,
      stops: 1,
      cabinClass: 'Economy',
    ),
    Flight(
      id: 'f5',
      airline: 'British Airways',
      flightNumber: 'BA 78',
      from: 'ACC',
      to: 'LHR',
      departure: DateTime(2026, 7, 22, 10, 15),
      arrival: DateTime(2026, 7, 22, 18, 40),
      duration: '6h 25m',
      price: 820,
      stops: 0,
      cabinClass: 'Economy',
    ),
  ];

  static final List<Booking> bookings = [
    Booking(
      id: 'b1',
      destinationName: 'Santorini, Greece',
      imageUrl: destinations[2].imageUrl,
      checkIn: DateTime(2026, 8, 5),
      checkOut: DateTime(2026, 8, 12),
      guests: 2,
      totalPrice: 2240,
      status: 'Confirmed',
    ),
    Booking(
      id: 'b2',
      destinationName: 'Bali, Indonesia',
      imageUrl: destinations[0].imageUrl,
      checkIn: DateTime(2026, 9, 1),
      checkOut: DateTime(2026, 9, 8),
      guests: 3,
      totalPrice: 1323,
      status: 'Pending',
    ),
  ];

  static final List<Ticket> tickets = [
    Ticket(
      id: 't1',
      title: 'Emirates EK 205',
      subtitle: 'Accra → Dubai',
      date: DateTime(2026, 7, 12, 8, 30),
      seatOrRoom: '12A · Economy',
      confirmationCode: 'EMR7X2K9',
      qrData: 'EMR7X2K9-EK205',
      type: 'Flight',
    ),
    Ticket(
      id: 't2',
      title: 'Caldera View Suites',
      subtitle: 'Oia, Santorini',
      date: DateTime(2026, 8, 5, 15, 0),
      seatOrRoom: 'Suite 204 · Sea View',
      confirmationCode: 'CVS4M8P1',
      qrData: 'CVS4M8P1-SUITE204',
      type: 'Hotel',
    ),
  ];

  static const List<String> categories = [
    'All',
    'Beach',
    'City',
    'Island',
    'Luxury',
    'Adventure',
  ];

  static const List<String> onboardingSlides = [
    'Explore breathtaking destinations around the world with curated travel experiences.',
    'Book flights and hotels in one seamless journey with real-time availability.',
    'Manage tickets, payments, and trips from a single beautiful dashboard.',
  ];

  static Destination? destinationById(String id) {
    for (final d in destinations) {
      if (d.id == id) return d;
    }
    return null;
  }

  static List<Destination> popularDestinations() =>
      destinations.where((d) => d.isPopular).toList();
}
