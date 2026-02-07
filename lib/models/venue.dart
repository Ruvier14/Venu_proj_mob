class Venue {
  final String id;
  final String name;
  final String city;
  final String description;
  final double price;
  final double rating;
  final int reviewCount;
  final List<String> images;
  final List<String> amenities;
  final String hostName;
  final String? hostImage;
  final int hostDaysHosting;
  final double communicationRating;
  final double easeOfCheckIn;
  final double cancellationRate;
  final String venueType;
  final int maxGuests;
  final String? status;
  final bool isFavorite;
  final List<String> occasions;
  final HouseRules? houseRules;
  final List<Review> reviews;

  const Venue({
    required this.id,
    required this.name,
    required this.city,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.images,
    required this.amenities,
    required this.hostName,
    this.hostImage,
    this.hostDaysHosting = 0,
    this.communicationRating = 0,
    this.easeOfCheckIn = 0,
    this.cancellationRate = 0,
    this.venueType = 'Event Space',
    this.maxGuests = 50,
    this.status,
    this.isFavorite = false,
    this.occasions = const [],
    this.houseRules,
    this.reviews = const [],
  });

  Venue copyWith({bool? isFavorite}) {
    return Venue(
      id: id,
      name: name,
      city: city,
      description: description,
      price: price,
      rating: rating,
      reviewCount: reviewCount,
      images: images,
      amenities: amenities,
      hostName: hostName,
      hostImage: hostImage,
      hostDaysHosting: hostDaysHosting,
      communicationRating: communicationRating,
      easeOfCheckIn: easeOfCheckIn,
      cancellationRate: cancellationRate,
      venueType: venueType,
      maxGuests: maxGuests,
      status: status,
      isFavorite: isFavorite ?? this.isFavorite,
      occasions: occasions,
      houseRules: houseRules,
      reviews: reviews,
    );
  }
}

class HouseRules {
  final String checkIn;
  final String checkOut;
  final String children;
  final String pets;
  final String events;
  final String smoking;
  final int minAge;
  final List<String> checkoutInstructions;

  const HouseRules({
    this.checkIn = '3:00 PM',
    this.checkOut = '11:00 AM',
    this.children = 'Adults only',
    this.pets = 'No pets allowed',
    this.events = 'Events allowed',
    this.smoking = 'Smoking is not permitted',
    this.minAge = 18,
    this.checkoutInstructions = const [],
  });
}

class Review {
  final String id;
  final String userName;
  final String? userImage;
  final double rating;
  final String comment;
  final String date;
  final bool isVerified;

  const Review({
    required this.id,
    required this.userName,
    this.userImage,
    required this.rating,
    required this.comment,
    required this.date,
    this.isVerified = false,
  });
}

class VenueSection {
  final String title;
  final List<Venue> venues;

  const VenueSection({
    required this.title,
    required this.venues,
  });
}
