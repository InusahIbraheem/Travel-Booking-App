class Destination {
  const Destination({
    required this.id,
    required this.name,
    required this.country,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.pricePerNight,
    required this.description,
    required this.highlights,
    required this.category,
    required this.isPopular,
  });

  final String id;
  final String name;
  final String country;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final double pricePerNight;
  final String description;
  final List<String> highlights;
  final String category;
  final bool isPopular;

  String get locationLabel => '$name, $country';
}
