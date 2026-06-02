enum ProviderType { doctor, clinic, hospital }

class ProviderModel {
  final String id;
  final String name;
  final ProviderType type;
  final String category;
  final String country;
  final String city;
  final double rating;

  final int reviewCount;
  final int postCount;
  final int followCount;
  final bool isVerified;

  final String? workplace;
  final String? bio;
  final String? email;
  final String? phone;

  ProviderModel({
    required this.id,
    required this.name,
    required this.type,
    required this.category,
    required this.country,
    required this.city,
    required this.rating,
    required this.reviewCount,
    required this.postCount,
    required this.followCount,
    this.workplace,
    this.isVerified = false,
    this.bio,
    this.email,
    this.phone
  });

  ProviderModel copyWith({
    String? id,
    String? name,
    ProviderType? type,
    String? category,
    String? country,
    String? city,
    double? rating,
    int? reviewCount,
    int? postCount,
    int? followCount,
    String? workplace,
    bool? isVerified,
    String? bio,
    String? email,
    String? phone,
  }) {
    return ProviderModel(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      category: category ?? this.category,
      country: country ?? this.country,
      city: city ?? this.city,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      postCount: postCount ?? this.postCount,
      followCount: followCount ?? this.followCount,
      workplace: workplace ?? this.workplace,
      isVerified: isVerified ?? this.isVerified,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      phone: phone ?? this.phone
    );
  }
}