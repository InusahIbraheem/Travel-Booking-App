class UserProfile {
  const UserProfile({
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.memberSince,
    required this.tripsCompleted,
    required this.loyaltyPoints,
  });

  final String name;
  final String email;
  final String avatarUrl;
  final DateTime memberSince;
  final int tripsCompleted;
  final int loyaltyPoints;
}
